#!/usr/bin/env python3
"""
Run multiple validators on one or more datasets and emit a Markdown table.

Designed for Tasks 1–2–3 (CityJSON) and Task 4+ (CityGML) in `dev/test/test_11-12.md`.

Validators
----------
- CityJSON:
  - `cjio <file> validate` (preferred, if available)
  - `cjvalpy` (direct official validator; used as a backstop)
  - CityJSONEditor importer preparation checks (`prepare_cityjson_for_import`)

- CityGML:
  - CityDoctorValidation (bundled under `CityDoctorValidation-3.17.3-lin/`)

Examples
--------
  # Vienna (CityJSON)
  python3 scripts/validate_matrix.py data/Vienna_102081.city.json --out dev/test/reports/vienna_102081_validation_matrix.md

  # CityGML export (Task 4+)
  python3 scripts/validate_matrix.py data/export/q4_from_db.gml --reports-dir dev/test/reports
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import os
import shutil
import subprocess
import sys
import tempfile
import textwrap
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from pathlib import Path
from typing import Any


# Avoid creating __pycache__ entries when loading modules dynamically.
sys.dont_write_bytecode = True


ROOT = Path(__file__).resolve().parents[1]


@dataclass(frozen=True)
class Row:
    file: Path
    file_type: str
    validator: str
    result: str
    details: str
    report: str
    command: str = ""


def _md_escape(s: str) -> str:
    # Keep it simple for tables.
    return s.replace("\\", "\\\\").replace("|", "\\|").replace("\n", "<br>")


def _rel(path: Path) -> str:
    try:
        return str(path.resolve().relative_to(ROOT.resolve()))
    except Exception:
        return str(path)


def _safe_exists(path: Path) -> bool:
    try:
        return path.exists()
    except OSError:
        return False


def _shorten(s: str, max_len: int = 180) -> str:
    s = " ".join(s.strip().split())
    if len(s) <= max_len:
        return s
    return s[: max_len - 1] + "…"


def _extract_section_issue(report: str, section: str) -> str | None:
    """
    Extract a representative line from a cjval/cjvalpy text report section.

    Returns None when the section is "ok" or not found.
    """
    lines = report.splitlines()
    header = f"=== {section} ==="
    try:
        i = next(i for i, ln in enumerate(lines) if ln.strip() == header)
    except StopIteration:
        return None

    for ln in lines[i + 1 :]:
        s = ln.strip()
        if not s:
            continue
        if s.startswith("=== "):
            return None
        if s == "ok":
            return None
        # Some schema errors echo a full object JSON; skip ultra-long payloads.
        if s.startswith("{") and len(s) > 250:
            continue
        return _shorten(s)
    return None


def _extract_report_details(report: str, status: str) -> str:
    if status == "PASS":
        return "ok"
    if status == "WARN":
        for sec in ("unused_vertices", "duplicate_vertices", "materials", "textures"):
            issue = _extract_section_issue(report, sec)
            if issue:
                return issue
        return "warnings"
    if status == "FAIL":
        issue = _extract_section_issue(report, "schema")
        if issue:
            return issue
        issue = _extract_section_issue(report, "json_syntax")
        if issue:
            return issue
        # Fallback: last meaningful line.
        for ln in reversed(report.splitlines()):
            s = ln.strip()
            if not s:
                continue
            # Skip separator/summary lines
            if s.startswith("===") or s.startswith("---") or s.startswith("=====") or "File is invalid" in s:
                continue
            return _shorten(s)
        return "invalid"
    return "unknown"


def _detect_cjio_bin() -> str | None:
    env_bin = os.environ.get("CJIO_BIN")
    if env_bin and _safe_exists(Path(env_bin)):
        return env_bin
        
    candidates = []
    if os.name == "nt":
        candidates += [
            ROOT / ".venv-win" / "Scripts" / "cjio.exe",
            ROOT / ".venv-win" / "Scripts" / "cjio",
            ROOT / ".venv" / "Scripts" / "cjio.exe",
            ROOT / ".venv" / "Scripts" / "cjio",
        ]
    else:
        candidates += [
            ROOT / ".venv" / "bin" / "cjio",
            ROOT / ".venv-cjio" / "bin" / "cjio",
        ]

    for candidate in candidates:
        if _safe_exists(candidate):
            return str(candidate)
    return shutil.which("cjio")


def _detect_cjvalpy_python() -> str | None:
    env_py = os.environ.get("CJVALPY_PYTHON")
    # Prefer current interpreter when cjvalpy is importable.
    try:
        import cjvalpy  # noqa: F401
        return sys.executable
    except Exception:
        pass
    if env_py and _safe_exists(Path(env_py)):
        return env_py
        
    candidates = []
    if os.name == "nt":
        candidates += [
            ROOT / ".venv-win" / "Scripts" / "python.exe",
            ROOT / ".venv-win" / "Scripts" / "python",
            ROOT / ".venv" / "Scripts" / "python.exe",
            ROOT / ".venv" / "Scripts" / "python",
        ]
    else:
        candidates += [
            ROOT / ".venv" / "bin" / "python",
            ROOT / ".venv" / "bin" / "python3",
        ]

    for candidate in candidates:
        if _safe_exists(candidate):
            return str(candidate)
    return None


def _classify_cjval_report(report: str) -> str:
    if "File is invalid" in report:
        return "FAIL"
    if "File is valid but has warnings" in report:
        return "WARN"
    if "File is valid" in report:
        return "PASS"
    return "UNKNOWN"


def _write_report(reports_dir: Path | None, stem: str, suffix: str, content: str) -> str:
    if reports_dir is None:
        return ""
    reports_dir.mkdir(parents=True, exist_ok=True)
    out = reports_dir / f"{stem}{suffix}"
    out.write_text(content, encoding="utf-8")
    return str(out)


def _run(cmd: list[str], timeout_s: int = 600) -> tuple[int, str]:
    env = {**os.environ, "PYTHONIOENCODING": "utf-8"}
    result = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8", env=env, timeout=timeout_s)
    out = (result.stdout or "") + (result.stderr or "")
    return result.returncode, out


def _load_json(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as fh:
        data = json.load(fh)
    if not isinstance(data, dict):
        raise ValueError("Root must be a JSON object")
    return data


def _ensure_cityjson_v2(
    src: Path, *, cjio_bin: str, ignore_duplicate_keys: bool, tmpdir: Path
) -> tuple[Path, bool]:
    data = _load_json(src)
    version = data.get("version")
    if version == "2.0":
        return src, False

    out = tmpdir / f"{src.stem}.v2.json"
    cmd = [cjio_bin]
    if ignore_duplicate_keys:
        cmd.append("--ignore_duplicate_keys")
    cmd += [str(src), "upgrade", "save", str(out)]
    code, out_text = _run(cmd)
    if code != 0:
        raise RuntimeError(out_text.strip() or f"cjio upgrade failed (exit {code})")
    return out, True


def run_cjio_validate(
    path: Path,
    *,
    cjio_bin: str | None,
    reports_dir: Path | None,
    ignore_duplicate_keys: bool,
) -> tuple[str, str, str, str]:
    if not cjio_bin:
        return "SKIP", "cjio not found", "", ""

    with tempfile.TemporaryDirectory(prefix="validate_matrix_") as d:
        tmpdir = Path(d)
        try:
            validate_path, upgraded = _ensure_cityjson_v2(
                path, cjio_bin=cjio_bin, ignore_duplicate_keys=ignore_duplicate_keys, tmpdir=tmpdir
            )
        except Exception as exc:
            return "FAIL", f"cjio upgrade failed: {exc}", "", ""

        cmd = [cjio_bin]
        if ignore_duplicate_keys:
            cmd.append("--ignore_duplicate_keys")
        cmd += [str(validate_path), "validate"]
        code, out_text = _run(cmd)

        # cjio sometimes prints errors but returns 0; detect that.
        cmd_str = " ".join(cmd)
        if "Can't extract `str` to `Vec`" in out_text:
            return "FAIL", "cjio validate hit cjvalpy API mismatch (run scripts/fix_cjio_validate.py)", "", cmd_str
        if "Error:" in out_text or "Traceback" in out_text:
            # Keep the first line after 'Error:' if possible.
            msg = out_text.strip().splitlines()[-1] if out_text.strip() else f"exit {code}"
            return "FAIL", msg, _write_report(reports_dir, path.stem, ".cjio_validate.txt", out_text), cmd_str

        status = _classify_cjval_report(out_text)
        details = _extract_report_details(out_text, status)
        if upgraded:
            details = f"{details} (upgraded v2.0 copy)"
        if status == "UNKNOWN":
            details = (out_text.strip().splitlines()[-1] if out_text.strip() else "no output")[:200]

        report_path = _write_report(reports_dir, path.stem, ".cjio_validate.txt", out_text)
        cmd_str = " ".join(cmd)
        if code != 0 and status == "PASS":
            # Unusual, but be conservative.
            return "FAIL", f"cjio exited {code}", report_path, cmd_str
        return status, details, report_path, cmd_str


def run_cjvalpy_validate(path: Path, *, python_bin: str | None, reports_dir: Path | None) -> tuple[str, str, str, str]:
    if not python_bin:
        return "SKIP", "cjvalpy not available", "", ""

    code_script = textwrap.dedent(
        r"""
        import json
        import urllib.request
        from pathlib import Path
        import sys

        if hasattr(sys.stdout, "reconfigure"):
            sys.stdout.reconfigure(encoding="utf-8")

        import cjvalpy

        p = Path(__import__("sys").argv[1])
        data = json.loads(p.read_text(encoding="utf-8"))
        js = [json.dumps(data)]

        exts = data.get("extensions")
        if isinstance(exts, dict):
            for ext in exts.values():
                if not isinstance(ext, dict):
                    continue
                url = ext.get("url")
                if not url:
                    continue
                try:
                    with urllib.request.urlopen(url) as f:
                        js.append(f.read().decode("utf-8"))
                except Exception:
                    pass

        v = cjvalpy.CJValidator(js)
        v.validate()
        print(v.get_report())
        """
    ).strip()
    full_cmd = [python_bin, "-c", code_script, str(path)]
    code_ret, out_text = _run(full_cmd)
    cmd_str = f"{python_bin} -c '...' {path}"
    
    if code_ret != 0:
        report_path = _write_report(reports_dir, path.stem, ".cjvalpy_validate.txt", out_text)
        return "FAIL", out_text.strip().splitlines()[-1] if out_text.strip() else "cjvalpy failed", report_path, cmd_str

    status = _classify_cjval_report(out_text)
    details = _extract_report_details(out_text, status)
    report_path = _write_report(reports_dir, path.stem, ".cjvalpy_validate.txt", out_text)
    return status, details, report_path, cmd_str


def _load_prepare_cityjson_for_import():
    validation_path = ROOT / "CityJSONEditor" / "core" / "validation.py"
    spec = importlib.util.spec_from_file_location("cje_validation", validation_path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"Could not load {validation_path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module.prepare_cityjson_for_import


def run_import_prep(path: Path, *, allow_textures: bool) -> tuple[str, str, str, str]:
    try:
        prepare = _load_prepare_cityjson_for_import()
        ok, msg, _data, changed = prepare(path, allow_textures=allow_textures, write_back=False)
    except Exception as exc:
        return "FAIL", f"exception: {exc}", "", ""

    cmd_str = f"prepare_cityjson_for_import({path.name}, allow_textures={allow_textures})"
    if not ok:
        return "FAIL", msg, "", cmd_str
    if changed:
        return "WARN", "would modify a copy for Blender import stability", "", cmd_str
    return "PASS", "no changes needed", "", cmd_str


def run_citydoctor(
    path: Path,
    *,
    reports_dir: Path | None,
    config_path: Path | None,
) -> tuple[str, str, str, str]:
    if path.suffix.lower() != ".gml":
        return "SKIP", "not a .gml file", "", ""

    if os.name == "nt":
        citydoctor_root = ROOT / "CityDoctorValidation-3.17.3-win"
        java_bin = citydoctor_root / "runtime" / "bin" / "java.exe"
        cp_sep = ";"
    else:
        citydoctor_root = ROOT / "CityDoctorValidation-3.17.3-lin"
        java_bin = citydoctor_root / "runtime" / "bin" / "java"
        cp_sep = ":"

    if not citydoctor_root.exists() or not java_bin.exists():
        # Fallback: try the other distribution.
        alt_root = ROOT / ("CityDoctorValidation-3.17.3-lin" if os.name == "nt" else "CityDoctorValidation-3.17.3-win")
        alt_java = alt_root / "runtime" / "bin" / ("java.exe" if os.name != "nt" else "java")
        if alt_root.exists() and alt_java.exists():
            citydoctor_root = alt_root
            java_bin = alt_java
            cp_sep = ":" if os.name != "nt" else ";"
        else:
            return "SKIP", "CityDoctorValidation runtime not found", "", ""

    cfg = config_path or (citydoctor_root / "testConfigWithStreaming.yml")
    if not cfg.exists():
        return "SKIP", f"missing config: {cfg}", "", ""

    if reports_dir is None:
        tmpdir = Path(tempfile.mkdtemp(prefix="citydoctor_"))
        out_xml = tmpdir / f"{path.stem}.citydoctor.xml"
    else:
        reports_dir.mkdir(parents=True, exist_ok=True)
        out_xml = reports_dir / f"{path.stem}.citydoctor.xml"

    classpath = (
        f"{(citydoctor_root / 'app').as_posix()}/*"
        f"{cp_sep}{(citydoctor_root / 'plugin').as_posix()}/*"
    )
    cmd = [
        str(java_bin),
        "-classpath",
        classpath,
        "de.hft.stuttgart.citydoctor2.CityDoctorValidation",
        "-in",
        str(path),
        "-config",
        str(cfg),
        "-xmlReport",
        str(out_xml),
    ]
    cmd_str = " ".join(cmd)
    code, out_text = _run(cmd, timeout_s=1800)
    # CityDoctorValidation tends to exit 0 even on exceptions; we rely on the XML report for classification.
    report_path = str(out_xml) if out_xml.exists() else ""
    if not out_xml.exists():
        return "FAIL", (out_text.strip().splitlines()[-1] if out_text.strip() else f"exit {code}"), report_path, cmd_str

    try:
        ns = {"cd": "http://www.citydoctor.eu"}
        root = ET.parse(out_xml).getroot()
        errors = {}
        for err in root.findall(".//cd:errors/cd:error", ns):
            name = err.attrib.get("name", "<missing>")
            try:
                errors[name] = int((err.text or "0").strip())
            except Exception:
                errors[name] = 0
        total = sum(errors.values())
        unknown = errors.get("Unknown_error", 0)
        if unknown:
            return "WARN", f"{total} errors (Unknown_error={unknown})", report_path, cmd_str
        if total:
            return "WARN", f"{total} errors", report_path, cmd_str
        return "PASS", "no errors reported", report_path, cmd_str
    except Exception as exc:
        return "WARN", f"report generated but parse failed: {exc}", report_path, cmd_str


def detect_file_type(path: Path) -> str:
    ext = path.suffix.lower()
    if ext in (".gml", ".xml"):
        return "CityGML"
    if ext in (".json", ".city.json"):
        return "CityJSON"
    # Best-effort probe.
    try:
        data = _load_json(path)
    except Exception:
        return "unknown"
    if data.get("type") == "CityJSON":
        return "CityJSON"
    return "unknown"


def render_table(rows: list[Row]) -> str:
    def _html_result(status: str) -> str:
        colors = {
            "PASS": "#1a7f37",
            "WARN": "#9a6700",
            "FAIL": "#d1242f",
            "SKIP": "#6e7781",
            "UNKNOWN": "#6e7781",
        }
        c = colors.get(status, "#6e7781")
        return f'<span style="color: {c}; font-weight: 600">{status}</span>'

    # Default is plain text; opt-in via `--color` in main().
    use_color = False
    try:
        use_color = bool(getattr(render_table, "_use_color", False))  # type: ignore[attr-defined]
    except Exception:
        use_color = False

    lines = [
        "| File | Type | Validator | Result | Details | Report |",
        "|---|---|---|---|---|---|",
    ]
    for r in rows:
        result = _html_result(r.result) if use_color else r.result
        lines.append(
            "| "
            + " | ".join(
                [
                    _md_escape(_rel(r.file)),
                    _md_escape(r.file_type),
                    _md_escape(r.validator),
                    _md_escape(result),
                    _md_escape(r.details),
                    _md_escape(r.report),
                ]
            )
            + " |"
        )
        if r.command:
            lines.append(f"| | | | | **Cmd:** `{_md_escape(r.command)}` | |")
    return "\n".join(lines) + "\n"


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(description="Run multiple validators and emit a Markdown matrix.")
    p.add_argument("files", nargs="+", type=Path, help="Input files (.city.json/.json or .gml)")
    p.add_argument("--out", type=Path, default=None, help="Write Markdown table to this path")
    p.add_argument(
        "--reports-dir",
        type=Path,
        default=None,
        help="Optional directory to write raw validator outputs (txt/xml)",
    )
    p.add_argument("--no-textures", action="store_true", help="Disable textures for importer-prep check")
    p.add_argument(
        "--ignore-duplicate-keys",
        action="store_true",
        help="Allow cjio to load duplicate JSON keys when upgrading (debugging only).",
    )
    p.add_argument(
        "--citydoctor-config",
        type=Path,
        default=None,
        help="Override CityDoctorValidation config YAML (CityGML only).",
    )
    p.add_argument("--color", action="store_true", help="Color PASS/WARN/FAIL with HTML spans in Markdown output")
    return p.parse_args()


def main() -> None:
    args = parse_args()
    try:
        setattr(render_table, "_use_color", bool(args.color))  # type: ignore[attr-defined]
    except Exception:
        pass

    cjio_bin = _detect_cjio_bin()
    cjvalpy_python = _detect_cjvalpy_python()

    rows: list[Row] = []
    for f in args.files:
        path = f.resolve()
        if not path.exists():
            rows.append(Row(path, "unknown", "-", "FAIL", "file not found", ""))
            continue

        ftype = detect_file_type(path)
        if ftype == "CityJSON":
            status, details, report = run_cjio_validate(
                path,
                cjio_bin=cjio_bin,
                reports_dir=args.reports_dir,
                ignore_duplicate_keys=args.ignore_duplicate_keys,
            )
            rows.append(Row(path, ftype, "cjio validate", status, details, report))

            status, details, report = run_cjvalpy_validate(
                path, python_bin=cjvalpy_python, reports_dir=args.reports_dir
            )
            rows.append(Row(path, ftype, "cjvalpy", status, details, report))

            status, details, report = run_import_prep(path, allow_textures=not args.no_textures)
            rows.append(Row(path, ftype, "CityJSONEditor prep", status, details, report))
        elif ftype == "CityGML":
            status, details, report = run_citydoctor(
                path, reports_dir=args.reports_dir, config_path=args.citydoctor_config
            )
            rows.append(Row(path, ftype, "CityDoctorValidation", status, details, report))
        else:
            rows.append(Row(path, ftype, "-", "SKIP", "unsupported/unknown type", ""))

    md = render_table(rows)
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(md, encoding="utf-8")
    else:
        print(md)
    # Non-zero exit if any validator reports a hard failure.
    if any(r.result == "FAIL" for r in rows):
        raise SystemExit(1)


if __name__ == "__main__":
    if os.name == "nt":
        # Force UTF-8 for Windows console output
        import sys
        sys.stdout.reconfigure(encoding="utf-8")
    main()
