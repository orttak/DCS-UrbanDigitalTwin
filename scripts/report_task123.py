#!/usr/bin/env python3
"""
Generate a single Markdown report for Tasks 1–2–3 (CityJSON):
  - Multi-validator results (cjio, cjvalpy, CityJSONEditor prep)
  - Key diffs between the provided files

Typical usage for Vienna (3 files):
  python3 scripts/report_task123.py \
    data/Vienna_102081.city.json \
    data/Vienna_102081-export.city.json \
    data/Vienna_102081-exportwithdoorwindowandblacony.city.json \
    --out dev/test/reports/vienna_102081_task123_report.md \
    --reports-dir dev/test/reports
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import os
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Any


sys.dont_write_bytecode = True


ROOT = Path(__file__).resolve().parents[1]


def _load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"Could not load module {name} from {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def _rel(path: Path) -> str:
    try:
        return str(path.resolve().relative_to(ROOT.resolve()))
    except Exception:
        return str(path)


def _md_escape(s: str) -> str:
    return s.replace("\\", "\\\\").replace("|", "\\|").replace("\n", "<br>")


def _shorten(s: str, max_len: int = 120) -> str:
    s = " ".join(s.strip().split())
    return s if len(s) <= max_len else (s[: max_len - 1] + "…")


def _html_result(status: str) -> str:
    # GitHub/VSC Markdown: keep it readable even if styles are stripped.
    colors = {
        "PASS": "#1a7f37",
        "WARN": "#9a6700",
        "FAIL": "#d1242f",
        "SKIP": "#6e7781",
        "UNKNOWN": "#6e7781",
    }
    c = colors.get(status, "#6e7781")
    return f'<span style="color: {c}; font-weight: 600">{status}</span>'


def _fmt_delta(delta: Any) -> str:
    if delta is None:
        return ""
    try:
        d = float(delta)
    except Exception:
        return str(delta)
    if d == 0:
        return f"{int(d)}"
    color = "#1a7f37" if d > 0 else "#d1242f"
    s = f"{int(d)}" if d.is_integer() else f"{d:g}"
    sign = "+" if d > 0 else ""
    return f'<span style="color: {color}; font-weight: 600">{sign}{s}</span>'


def _fmt_change(a: Any, b: Any, delta: Any | None = None) -> str:
    if a is None or b is None:
        return ""
    try:
        if delta is None and isinstance(a, (int, float)) and isinstance(b, (int, float)):
            delta = b - a
    except Exception:
        delta = None
    if delta is None:
        return f"{a}->{b}"
    try:
        d = float(delta)
    except Exception:
        return f"{a}->{b}"
    sign = "+" if d > 0 else ""
    return f"{a}->{b} ({_fmt_delta(d) if sign else _fmt_delta(d)})"


def _get_ab(delta_dict: Any) -> tuple[Any | None, Any | None]:
    if not isinstance(delta_dict, dict):
        return None, None
    return delta_dict.get("a"), delta_dict.get("b")


def _get_counter_entry(counter_dict: Any, key: str) -> dict[str, Any] | None:
    if not isinstance(counter_dict, dict):
        return None
    entry = counter_dict.get(key)
    return entry if isinstance(entry, dict) else None


def _write_json(reports_dir: Path | None, filename: str, payload: dict[str, Any]) -> str:
    if reports_dir is None:
        return ""
    reports_dir.mkdir(parents=True, exist_ok=True)
    out = reports_dir / filename
    out.write_text(json.dumps(payload, indent=2), encoding="utf-8")
    return _rel(out)


def _render_diff_table(rows: list[dict[str, str]]) -> str:
    headers = [
        "Pair",
        "Version",
        "LoD",
        "CityObjects",
        "Building",
        "BuildingPart",
        "BuildingInstallation",
        "WinDef",
        "WinFaces",
        "DoorDef",
        "DoorFaces",
        "Holes",
        "Vertices",
        "Surfaces",
        "BBoxΔmax",
        "ID Δ",
        "Diff Report",
    ]
    out = ["| " + " | ".join(headers) + " |", "|" + "|".join(["---"] * len(headers)) + "|"]
    for r in rows:
        out.append(
            "| "
            + " | ".join(_md_escape(r.get(h, "")) for h in headers)
            + " |"
        )
    return "\n".join(out) + "\n"


def _detect_cjio_bin(validate_matrix_module) -> str | None:
    try:
        return validate_matrix_module._detect_cjio_bin()  # type: ignore[attr-defined]
    except Exception:
        return None


def _load_json_obj(path: Path) -> dict[str, Any]:
    data = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(data, dict):
        raise ValueError("Root must be a JSON object")
    return data


def _detect_declared_version(path: Path) -> str | None:
    try:
        return str(_load_json_obj(path).get("version"))
    except Exception:
        return None


def _normalize_cityjson_to_v2(
    path: Path,
    *,
    cjio_bin: str | None,
    reports_dir: Path | None,
    ignore_duplicate_keys: bool,
) -> tuple[Path, str]:
    """
    Ensure we have a CityJSON v2.0 file for comparison.

    Returns (path_to_use, note). If the input is already v2.0, returns the original path.
    """
    declared = _detect_declared_version(path)
    if declared == "2.0":
        return path, "already v2.0"
    if not cjio_bin:
        return path, f"kept as v{declared or '?'} (cjio not found)"

    out_dir = None
    if reports_dir is not None:
        out_dir = reports_dir / "normalized"
        out_dir.mkdir(parents=True, exist_ok=True)
    else:
        out_dir = Path(tempfile.mkdtemp(prefix="cityjson_norm_"))

    name = path.name
    if name.endswith(".city.json"):
        out_name = name.replace(".city.json", ".city.v2.json")
    elif name.endswith(".json"):
        out_name = name.replace(".json", ".v2.json")
    else:
        out_name = f"{path.stem}.v2.json"
    out_path = out_dir / out_name

    cmd = [cjio_bin]
    if ignore_duplicate_keys:
        cmd.append("--ignore_duplicate_keys")
    cmd += [str(path), "upgrade", "save", str(out_path)]
    env = {**os.environ, "PYTHONIOENCODING": "utf-8"}
    proc = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", env=env)
    if proc.returncode != 0 or not out_path.exists():
        msg = (proc.stdout or "") + (proc.stderr or "")
        return path, f"v2 normalize failed: {_shorten(msg or f'exit {proc.returncode}', 120)}"
    return out_path, f"upgraded v{declared or '?'} -> v2.0 ({_rel(out_path)})"


def _suggest_fixes(file_path: Path, details: str) -> list[str]:
    d = details.lower()
    suggestions: list[str] = []
    if "/appearance/textures" in d and "null" in d:
        suggestions.append(
            f"Invalid texture metadata: try `cjio {file_path} textures_remove save <out.city.json>` (or fix `appearance.textures[].image/type`)."
        )
    if "/metadata/referencesystem" in d and "does not match" in d:
        suggestions.append(
            f"Invalid CRS: set `metadata.referenceSystem` to an OGC CRS URI (e.g. `https://www.opengis.net/def/crs/EPSG/0/<code>`) or delete it."
        )
    if "only files with version v2.0 can be validated" in d:
        suggestions.append(f"Upgrade first: `cjio {file_path} upgrade save <out.city.json>`")
    return suggestions


def main() -> None:
    ap = argparse.ArgumentParser(description="Generate validation + diff report for Task 1–2–3 CityJSON files.")
    ap.add_argument("files", nargs="+", type=Path, help="Input CityJSON files in order (baseline, export, edits, ...)")
    ap.add_argument("--out", type=Path, default=None, help="Write Markdown report to this path (default: stdout)")
    ap.add_argument("--reports-dir", type=Path, default=None, help="Write raw validator/diff reports to this directory")
    ap.add_argument(
        "--no-textures",
        action="store_true",
        help="Disable textures for CityJSONEditor prep check",
    )
    ap.add_argument(
        "--ignore-duplicate-keys",
        action="store_true",
        help="Allow cjio to load duplicate JSON keys when upgrading (debugging only).",
    )
    ap.add_argument(
        "--no-normalize-v2",
        action="store_true",
        help="Do not create v2.0 normalized copies for comparisons (comparisons will use files as-is).",
    )
    args = ap.parse_args()

    validate_matrix = _load_module("validate_matrix", ROOT / "scripts" / "validate_matrix.py")
    compare_cityjson = _load_module("compare_cityjson", ROOT / "scripts" / "compare_cityjson.py")

    files = [p.resolve() for p in args.files]

    # --- Input summary (declared versions) ---
    input_lines = [
        "| File | Declared Version | Notes |",
        "|---|---|---|",
    ]
    for f in files:
        ver = _detect_declared_version(f) if f.exists() else None
        note = ""
        if ver and ver.count(".") >= 2:
            note = "CityJSON files should use X.Y (not X.Y.Z); use 2.0 with spec 2.0.1."
        input_lines.append(f"| {_md_escape(_rel(f))} | {_md_escape(ver or '<unknown>')} | {_md_escape(note)} |")
    input_md = "\n".join(input_lines) + "\n"

    # --- Validation matrix (reuse validate_matrix implementation) ---
    cjio_bin = _detect_cjio_bin(validate_matrix)
    cjvalpy_py = validate_matrix._detect_cjvalpy_python()  # type: ignore[attr-defined]

    vrows = []
    file_types: list[str] = []
    for f in files:
        if not f.exists():
            vrows.append(validate_matrix.Row(f, "unknown", "-", "FAIL", "file not found", ""))  # type: ignore[attr-defined]
            file_types.append("unknown")
            continue
        ftype = validate_matrix.detect_file_type(f)  # type: ignore[attr-defined]
        file_types.append(ftype)
        if ftype == "CityJSON":
            status, details, report, cmd = validate_matrix.run_cjio_validate(  # type: ignore[attr-defined]
                f,
                cjio_bin=cjio_bin,
                reports_dir=args.reports_dir,
                ignore_duplicate_keys=args.ignore_duplicate_keys,
            )
            vrows.append(validate_matrix.Row(f, ftype, "cjio validate", status, details, _rel(Path(report)) if report else "", cmd))  # type: ignore[attr-defined]

            status, details, report, cmd = validate_matrix.run_cjvalpy_validate(  # type: ignore[attr-defined]
                f, python_bin=cjvalpy_py, reports_dir=args.reports_dir
            )
            vrows.append(validate_matrix.Row(f, ftype, "cjvalpy", status, details, _rel(Path(report)) if report else "", cmd))  # type: ignore[attr-defined]

            status, details, report, cmd = validate_matrix.run_import_prep(  # type: ignore[attr-defined]
                f, allow_textures=not args.no_textures
            )
            vrows.append(validate_matrix.Row(f, ftype, "CityJSONEditor prep", status, details, report, cmd))  # type: ignore[attr-defined]
        elif ftype == "CityGML":
            status, details, report, cmd = validate_matrix.run_citydoctor(  # type: ignore[attr-defined]
                f, reports_dir=args.reports_dir, config_path=None
            )
            vrows.append(validate_matrix.Row(f, ftype, "CityDoctorValidation", status, details, _rel(Path(report)) if report else "", cmd))  # type: ignore[attr-defined]
        else:
            vrows.append(validate_matrix.Row(f, ftype, "-", "SKIP", "not CityJSON", ""))  # type: ignore[attr-defined]

    # Colorize validation results in Markdown (HTML spans; still readable if not rendered).
    try:
        setattr(validate_matrix.render_table, "_use_color", True)  # type: ignore[attr-defined]
    except Exception:
        pass
    validation_md = validate_matrix.render_table(vrows)  # type: ignore[attr-defined]
    
    # Custom status summary for validation
    fail_count = sum(1 for r in vrows if r.result == "FAIL")
    warn_count = sum(1 for r in vrows if r.result == "WARN")
    if fail_count:
        val_status = f"🔴 {fail_count} failures"
    elif warn_count:
        val_status = f"🟡 {warn_count} warnings"
    else:
        val_status = "🟢 all passed"

    # --- Normalize to v2.0 for comparisons (optional) ---
    norm_notes: dict[Path, str] = {}
    norm_paths: dict[Path, Path] = {}
    if args.no_normalize_v2:
        for f in files:
            norm_paths[f] = f
            norm_notes[f] = "disabled"
    else:
        for f in files:
            if not f.exists():
                norm_paths[f] = f
                norm_notes[f] = "missing"
                continue
            norm_p, note = _normalize_cityjson_to_v2(
                f, cjio_bin=cjio_bin, reports_dir=args.reports_dir, ignore_duplicate_keys=args.ignore_duplicate_keys
            )
            norm_paths[f] = norm_p
            norm_notes[f] = note

    # --- Comparisons (pairs) ---
    cityjson_indices = [i for i, t in enumerate(file_types) if t == "CityJSON"]
    pairs: list[tuple[int, int]] = []
    if len(cityjson_indices) >= 2:
        pairs.append((cityjson_indices[0], cityjson_indices[1]))
    if len(cityjson_indices) >= 3:
        pairs.append((cityjson_indices[1], cityjson_indices[2]))
        pairs.append((cityjson_indices[0], cityjson_indices[2]))
    if len(cityjson_indices) > 3:
        baseline = cityjson_indices[0]
        pairs.extend((baseline, i) for i in cityjson_indices[3:])

    diff_rows: list[dict[str, str]] = []
    findings: list[str] = []
    for ia, ib in pairs:
        a_path = files[ia]
        b_path = files[ib]

        a_cmp_path = norm_paths.get(a_path, a_path)
        b_cmp_path = norm_paths.get(b_path, b_path)
        a = compare_cityjson.load_cityjson(a_cmp_path)
        b = compare_cityjson.load_cityjson(b_cmp_path)
        rep = compare_cityjson.compare_cityjson(
            a,
            b,
            a_path=a_cmp_path,
            b_path=b_cmp_path,
            scan_geometry=True,
            check_texture_files=False,
        )
        # Preserve original paths in the report for readability.
        rep["a"]["original_path"] = _rel(a_path)
        rep["b"]["original_path"] = _rel(b_path)
        if a_cmp_path != a_path:
            rep["a"]["normalized_path"] = _rel(a_cmp_path)
        if b_cmp_path != b_path:
            rep["b"]["normalized_path"] = _rel(b_cmp_path)

        report_rel = ""
        if args.reports_dir is not None:
            fname = f"{a_path.stem}__vs__{b_path.stem}.diff.json"
            report_rel = _write_json(args.reports_dir, fname, rep)

        a_ver = rep.get("a", {}).get("version")
        b_ver = rep.get("b", {}).get("version")
        version_str = f"{a_ver}->{b_ver}" if a_ver is not None or b_ver is not None else ""

        d = rep.get("delta", {})

        co_a, co_b = _get_ab(d.get("cityobjects_total"))
        holes_a, holes_b = _get_ab(d.get("holes_total"))
        vtx_a, vtx_b = _get_ab(d.get("vertices_count"))
        surf_a, surf_b = _get_ab(d.get("surface_primitives_total"))

        co_types = d.get("cityobjects_by_type", {})
        building = _get_counter_entry(co_types, "Building") or {}
        bpart = _get_counter_entry(co_types, "BuildingPart") or {}
        binst = _get_counter_entry(co_types, "BuildingInstallation") or {}

        sem_defs = d.get("semantic_defs_by_type", {})
        sem_assign = d.get("semantic_assignments_by_type", {})
        win_def = _get_counter_entry(sem_defs, "Window") or {}
        door_def = _get_counter_entry(sem_defs, "Door") or {}
        win_faces = _get_counter_entry(sem_assign, "Window") or {}
        door_faces = _get_counter_entry(sem_assign, "Door") or {}

        a_lod = (rep.get("a", {}).get("geometries_by_lod") or {}) if isinstance(rep.get("a", {}), dict) else {}
        b_lod = (rep.get("b", {}).get("geometries_by_lod") or {}) if isinstance(rep.get("b", {}), dict) else {}
        try:
            a_dom = max(a_lod.items(), key=lambda kv: kv[1])[0] if a_lod else "<none>"
            b_dom = max(b_lod.items(), key=lambda kv: kv[1])[0] if b_lod else "<none>"
        except Exception:
            a_dom, b_dom = "<err>", "<err>"
        lod_s = f"{a_dom}->{b_dom}"

        bbox_delta = d.get("bbox_delta_max_abs")
        bbox_s = "" if bbox_delta is None else _shorten(str(bbox_delta), 20)

        id_diff = rep.get("id_diff", {}) or {}
        missing = id_diff.get("missing_in_b_count")
        added = id_diff.get("added_in_b_count")
        id_s = ""
        if isinstance(missing, int) and isinstance(added, int):
            id_s = f"-{missing}/+{added}"

        # --- Findings heuristics (human-readable hints) ---
        pair_label = f"{_rel(a_path)} -> {_rel(b_path)}"
        if isinstance(missing, int) and isinstance(added, int) and isinstance(co_a, int) and isinstance(co_b, int):
            if missing == co_a and added == co_b:
                findings.append(f"- `{pair_label}`: CityObject IDs do not overlap (not a clean roundtrip / different selection).")
        if a_dom != b_dom:
            findings.append(f"- `{pair_label}`: Dominant LoD changed `{a_dom}` → `{b_dom}`.")
        if bbox_delta is not None:
            try:
                if float(bbox_delta) > 1000:
                    findings.append(f"- `{pair_label}`: Huge bbox delta (`{bbox_delta}`) suggests different CRS/origin/georeferencing.")
            except Exception:
                pass
        try:
            wf_delta = int(win_faces.get("delta", 0) or 0)
            df_delta = int(door_faces.get("delta", 0) or 0)
            vtx_delta = int((vtx_b or 0) - (vtx_a or 0))
            surf_delta = int((surf_b or 0) - (surf_a or 0))
            if wf_delta == 0 and df_delta == 0 and (vtx_delta != 0 or surf_delta != 0):
                findings.append(
                    f"- `{pair_label}`: Geometry changed but Window/Door semantics did not; edits may not be saved as semantics (check SurfaceType assignment in Blender)."
                )
        except Exception:
            pass

        diff_rows.append(
            {
                "Pair": f"{_rel(a_path)} -> {_rel(b_path)}",
                "Version": version_str,
                "LoD": lod_s,
                "CityObjects": _fmt_change(co_a, co_b),
                "Building": _fmt_change(building.get("a"), building.get("b"), building.get("delta")),
                "BuildingPart": _fmt_change(bpart.get("a"), bpart.get("b"), bpart.get("delta")),
                "BuildingInstallation": _fmt_change(binst.get("a"), binst.get("b"), binst.get("delta")),
                "WinDef": _fmt_change(win_def.get("a"), win_def.get("b"), win_def.get("delta")),
                "WinFaces": _fmt_change(win_faces.get("a"), win_faces.get("b"), win_faces.get("delta")),
                "DoorDef": _fmt_change(door_def.get("a"), door_def.get("b"), door_def.get("delta")),
                "DoorFaces": _fmt_change(door_faces.get("a"), door_faces.get("b"), door_faces.get("delta")),
                "Holes": _fmt_change(holes_a, holes_b),
                "Vertices": _fmt_change(vtx_a, vtx_b),
                "Surfaces": _fmt_change(surf_a, surf_b),
                "BBoxΔmax": bbox_s,
                "ID Δ": id_s,
                "Diff Report": report_rel,
            }
        )

    diff_md = _render_diff_table(diff_rows) if diff_rows else "_No comparisons generated._\n"
    findings_md = "\n".join(dict.fromkeys(findings)) + "\n" if findings else "_No automatic findings._\n"

    # --- Fix hints (based on validator output) ---
    fixes_lines = []
    by_file: dict[Path, list[tuple[str, str, str]]] = {}
    for r in vrows:
        by_file.setdefault(r.file, []).append((r.validator, r.result, r.details))
    for f in files:
        rows = by_file.get(f, [])
        fails = [(v, d) for (v, s, d) in rows if s == "FAIL"]
        if not fails:
            continue
        fixes_lines.append(f"### {_rel(f)}\n")
        for v, det in fails:
            fixes_lines.append(f"- {_html_result('FAIL')} `{v}`: {_md_escape(det)}")
            for hint in _suggest_fixes(f, det):
                fixes_lines.append(f"  - {hint}")
        fixes_lines.append("")
    fixes_md = "\n".join(fixes_lines) if fixes_lines else "_No fix hints (no FAIL rows)._"

    # --- Version normalization notes ---
    norm_lines = [
        "| File | Comparison Path | Note |",
        "|---|---|---|",
    ]
    for f in files:
        cmp_p = norm_paths.get(f, f)
        norm_lines.append(f"| {_md_escape(_rel(f))} | {_md_escape(_rel(cmp_p))} | {_md_escape(norm_notes.get(f, ''))} |")
    norm_md = "\n".join(norm_lines) + "\n"

    md = (
        "# Task 1–2–3 Report\n\n"
        f"**Overall Validation Status:** {val_status}\n\n"
        "## Inputs\n\n"
        + input_md
        + "\n## Version Normalization (for comparisons)\n\n"
        + norm_md
        + "\n"
        "Notes:\n"
        "- Validation always uses the official CityJSON v2.0 schemas; v1.1 inputs are upgraded to a temporary v2.0 copy for schema checks.\n"
        "- Comparisons can optionally run on v2.0 normalized copies so version differences don't dominate the summary.\n\n"
        "## Validation Matrix\n\n"
        + validation_md
        + "\n## Comparison Summary\n\n"
        + diff_md
        + "\n## Key Findings\n\n"
        + findings_md
        + "\n## Fix Hints\n\n"
        + fixes_md
    )
    
    if len(cityjson_indices) >= 2:
        # Append the detailed first-pair comparison if available
        try:
            a_idx, b_idx = cityjson_indices[0], cityjson_indices[1]
            a_cmp_path = norm_paths.get(files[a_idx], files[a_idx])
            b_cmp_path = norm_paths.get(files[b_idx], files[b_idx])
            a = compare_cityjson.load_cityjson(a_cmp_path)
            b = compare_cityjson.load_cityjson(b_cmp_path)
            md += "\n\n---\n\n" + compare_cityjson.render_comparison_markdown(rep)
        except Exception as exc:
            md += f"\n\n---\n\n*Note: Detailed comparison failed: {exc}*"

    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(md, encoding="utf-8")
    else:
        print(md)


if __name__ == "__main__":
    if os.name == "nt":
        # Force UTF-8 for Windows console output
        import sys
        
        if hasattr(sys.stdout, "reconfigure"):
            sys.stdout.reconfigure(encoding="utf-8")
    main()
