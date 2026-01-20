#!/usr/bin/env python3
"""
CityJSON stats + diff helper.

Goals:
  - Quantify "data loss" after import/export cycles (Blender, 3DCityDB, etc.)
  - Stay robust to non-semantic differences (ordering, JSON formatting)

Examples:
  # Stats for one file
  python3 scripts/compare_cityjson.py data/sample_cityjson_1.1.json

  # Diff two files + write a JSON report
  python3 scripts/compare_cityjson.py a.json b.json --out diff_report.json

Notes:
  - Supports CityJSON Text Sequence (JSON Lines) exports by merging CityJSONFeature objects.
  - Uses only the Python standard library.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
from collections import Counter
from pathlib import Path
from typing import Any, Iterable


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as fh:
        for chunk in iter(lambda: fh.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def _as_list3(value: Any, default: list[float]) -> list[float]:
    if not isinstance(value, list) or len(value) != 3:
        return default
    out: list[float] = []
    for i in range(3):
        try:
            out.append(float(value[i]))
        except Exception:
            return default
    return out


def canonical_lod(value: Any) -> str:
    """Canonicalize CityJSON `lod` values to make comparisons robust (e.g., '2' == 2 == 2.0)."""
    if value is None:
        return "<none>"
    if isinstance(value, bool):
        return str(value)
    if isinstance(value, int):
        return str(value)
    if isinstance(value, float):
        if value.is_integer():
            return str(int(value))
        return str(value).rstrip("0").rstrip(".")
    if isinstance(value, str):
        s = value.strip()
        if not s:
            return "<empty>"
        try:
            f = float(s)
        except Exception:
            return s
        if f.is_integer():
            return str(int(f))
        return str(f).rstrip("0").rstrip(".")
    return str(value)


def get_transform(data: dict[str, Any]) -> tuple[list[float], list[float]]:
    transform = data.get("transform")
    if not isinstance(transform, dict):
        return [1.0, 1.0, 1.0], [0.0, 0.0, 0.0]
    scale = _as_list3(transform.get("scale"), [1.0, 1.0, 1.0])
    translate = _as_list3(transform.get("translate"), [0.0, 0.0, 0.0])
    return scale, translate


def bbox_from_vertices_raw(vertices: list[Any]) -> tuple[list[float], list[float]] | None:
    if not vertices:
        return None
    min_v = [math.inf, math.inf, math.inf]
    max_v = [-math.inf, -math.inf, -math.inf]
    for v in vertices:
        if not isinstance(v, list) or len(v) < 3:
            continue
        try:
            x, y, z = float(v[0]), float(v[1]), float(v[2])
        except Exception:
            continue
        if x < min_v[0]:
            min_v[0] = x
        if y < min_v[1]:
            min_v[1] = y
        if z < min_v[2]:
            min_v[2] = z
        if x > max_v[0]:
            max_v[0] = x
        if y > max_v[1]:
            max_v[1] = y
        if z > max_v[2]:
            max_v[2] = z
    if math.isinf(min_v[0]):
        return None
    return min_v, max_v


def bbox_apply_transform(
    raw_bbox: tuple[list[float], list[float]] | None, scale: list[float], translate: list[float]
) -> tuple[list[float], list[float]] | None:
    if raw_bbox is None:
        return None
    min_raw, max_raw = raw_bbox
    min_w = [0.0, 0.0, 0.0]
    max_w = [0.0, 0.0, 0.0]
    for i in range(3):
        a = min_raw[i] * scale[i] + translate[i]
        b = max_raw[i] * scale[i] + translate[i]
        min_w[i] = min(a, b)
        max_w[i] = max(a, b)
    return min_w, max_w


def load_cityjson(path: Path) -> dict[str, Any]:
    """
    Load a CityJSON file.

    Also supports "CityJSON Text Sequence" (JSON Lines) exports (CityJSON + CityJSONFeature per line),
    by merging them into one CityJSON dict in-memory.
    """

    def as_cityjson(obj: Any) -> dict[str, Any]:
        if not isinstance(obj, dict):
            raise ValueError("Not a JSON object")
        obj_type = obj.get("type")
        if obj_type == "CityJSON":
            return obj
        if obj_type in ("CityJSONFeature", "CityJSONFeatureCollection"):
            merged = {
                "type": "CityJSON",
                "version": obj.get("version", "1.0"),
                "CityObjects": obj.get("CityObjects", {}) or {},
                "vertices": obj.get("vertices", []) or [],
            }
            if "transform" in obj:
                merged["transform"] = obj["transform"]
            if "metadata" in obj:
                merged["metadata"] = obj["metadata"]
            if "appearance" in obj:
                merged["appearance"] = obj["appearance"]
            return merged
        raise ValueError(f"Unsupported CityJSON type: {obj_type!r}")

    try:
        with path.open("r", encoding="utf-8") as fh:
            return as_cityjson(json.load(fh))
    except json.JSONDecodeError:
        # Likely CityJSON Text Sequence / JSON Lines.
        objs: list[dict[str, Any]] = []
        with path.open("r", encoding="utf-8") as fh:
            for ln in fh:
                ln = ln.strip()
                if not ln:
                    continue
                objs.append(json.loads(ln))
        if not objs:
            raise ValueError(f"Empty file: {path}")

        base = objs[0]
        if not isinstance(base, dict) or base.get("type") != "CityJSON":
            # Single CityJSONFeature file exported as JSON lines without a base object.
            return as_cityjson(base)

        combined_cityobjects = base.get("CityObjects", {}) or {}
        vertices = base.get("vertices", []) or []
        transform = base.get("transform")
        metadata = base.get("metadata", {}) or {}
        appearance = base.get("appearance")

        for feat in objs[1:]:
            if not isinstance(feat, dict):
                continue
            if feat.get("type") not in ("CityJSONFeature", "CityJSONFeatureCollection"):
                continue
            if "CityObjects" in feat:
                combined_cityobjects.update(feat["CityObjects"] or {})
            if "vertices" in feat and not vertices:
                vertices = feat["vertices"] or []
            if "transform" in feat and not transform:
                transform = feat["transform"]
            if "metadata" in feat:
                metadata = {**metadata, **(feat["metadata"] or {})}
            if "appearance" in feat and not appearance:
                appearance = feat["appearance"]

        merged: dict[str, Any] = {
            "type": "CityJSON",
            "version": base.get("version", "1.0"),
            "CityObjects": combined_cityobjects,
            "vertices": vertices,
        }
        if transform is not None:
            merged["transform"] = transform
        if metadata:
            merged["metadata"] = metadata
        if appearance is not None:
            merged["appearance"] = appearance
        return merged


def _normalize_surface(surface: Any) -> list[list[int]]:
    if not isinstance(surface, list) or not surface:
        return []
    # Some invalid/quirky encoders might skip the ring nesting.
    if isinstance(surface[0], int):
        return [surface]  # type: ignore[return-value]
    rings: list[list[int]] = []
    for ring in surface:
        if not isinstance(ring, list):
            continue
        ring_ints: list[int] = []
        for idx in ring:
            if isinstance(idx, int):
                ring_ints.append(idx)
        if ring_ints:
            rings.append(ring_ints)
    return rings


def iter_surface_polygons(geom: dict[str, Any]) -> Iterable[list[list[int]]]:
    """Yield polygons as list-of-rings; each ring is a list of vertex indices."""
    geom_type = geom.get("type")
    boundaries = geom.get("boundaries")
    if boundaries is None:
        return

    if geom_type in ("MultiSurface", "CompositeSurface"):
        if isinstance(boundaries, list):
            for surf in boundaries:
                rings = _normalize_surface(surf)
                if rings:
                    yield rings
        return

    if geom_type == "Solid":
        if isinstance(boundaries, list):
            for shell in boundaries:
                if not isinstance(shell, list):
                    continue
                for surf in shell:
                    rings = _normalize_surface(surf)
                    if rings:
                        yield rings
        return

    if geom_type in ("MultiSolid", "CompositeSolid"):
        if isinstance(boundaries, list):
            for solid in boundaries:
                if not isinstance(solid, list):
                    continue
                for shell in solid:
                    if not isinstance(shell, list):
                        continue
                    for surf in shell:
                        rings = _normalize_surface(surf)
                        if rings:
                            yield rings
        return

    # Other geometry types (MultiPoint, MultiLineString, etc.) are ignored for polygon counts.


def _flatten_values(values: Any) -> list[Any]:
    out: list[Any] = []
    if values is None:
        return out
    if isinstance(values, list):
        if not values:
            return out
        if all(not isinstance(x, list) for x in values):
            out.extend(values)
            return out
        for x in values:
            out.extend(_flatten_values(x))
        return out
    out.append(values)
    return out


def compute_cityjson_stats(
    data: dict[str, Any],
    *,
    path: Path | None = None,
    scan_geometry: bool = True,
    check_texture_files: bool = False,
    sample_limit: int = 15,
) -> dict[str, Any]:
    cityobjects: dict[str, Any] = data.get("CityObjects", {}) or {}
    vertices: list[Any] = data.get("vertices", []) or []
    version = data.get("version")
    scale, translate = get_transform(data)

    by_type: Counter[str] = Counter()
    cityobjects_with_geometry = 0
    cityobjects_with_attributes = 0
    cityobjects_with_extent = 0
    geometries_total = 0
    geometries_by_type: Counter[str] = Counter()
    geometries_by_lod: Counter[str] = Counter()
    geometries_by_lod_type: Counter[str] = Counter()

    surface_primitives_total = 0
    rings_total = 0
    holes_total = 0
    vertex_refs_total = 0

    semantic_defs_by_type: Counter[str] = Counter()
    semantic_assignments_by_type: Counter[str] = Counter()
    semantic_assignments_total = 0

    geometries_with_texture = 0
    texture_themes: Counter[str] = Counter()
    texture_value_entries_nonnull = 0

    for obj in cityobjects.values():
        if not isinstance(obj, dict):
            continue
        by_type[str(obj.get("type", "<missing>"))] += 1

        if obj.get("attributes") is not None:
            cityobjects_with_attributes += 1
        if obj.get("geographicalExtent") is not None:
            cityobjects_with_extent += 1

        geoms = obj.get("geometry") or []
        if geoms:
            cityobjects_with_geometry += 1
        if not scan_geometry:
            geometries_total += len(geoms) if isinstance(geoms, list) else 0
            continue
        if not isinstance(geoms, list):
            continue

        for geom in geoms:
            if not isinstance(geom, dict):
                continue
            geometries_total += 1
            gtype = str(geom.get("type", "<missing>"))
            geometries_by_type[gtype] += 1
            lod_key = canonical_lod(geom.get("lod"))
            geometries_by_lod[lod_key] += 1
            geometries_by_lod_type[f"{lod_key}|{gtype}"] += 1

            for poly in iter_surface_polygons(geom):
                surface_primitives_total += 1
                rings_total += len(poly)
                holes_total += max(0, len(poly) - 1)
                for ring in poly:
                    vertex_refs_total += len(ring)

            semantics = geom.get("semantics")
            if isinstance(semantics, dict):
                surfaces = semantics.get("surfaces") or []
                if isinstance(surfaces, list):
                    for s in surfaces:
                        if isinstance(s, dict):
                            semantic_defs_by_type[str(s.get("type", "<missing>"))] += 1
                        else:
                            semantic_defs_by_type["<invalid>"] += 1

                values = semantics.get("values")
                flat = _flatten_values(values)
                semantic_assignments_total += len(flat)
                for v in flat:
                    if v is None:
                        semantic_assignments_by_type["<null>"] += 1
                        continue
                    if not isinstance(v, int):
                        semantic_assignments_by_type["<invalid>"] += 1
                        continue
                    if not isinstance(surfaces, list) or v < 0 or v >= len(surfaces):
                        semantic_assignments_by_type["<out_of_range>"] += 1
                        continue
                    s = surfaces[v]
                    if isinstance(s, dict):
                        semantic_assignments_by_type[str(s.get("type", "<missing>"))] += 1
                    else:
                        semantic_assignments_by_type["<invalid>"] += 1

            texture = geom.get("texture")
            if isinstance(texture, dict) and texture:
                geometries_with_texture += 1
                for theme_name, theme in texture.items():
                    texture_themes[str(theme_name)] += 1
                    if isinstance(theme, dict) and "values" in theme:
                        leaves = _flatten_values(theme.get("values"))
                        # Leaves here are typically ring-mappings or nulls; count non-null as a signal.
                        texture_value_entries_nonnull += sum(1 for x in leaves if x is not None)

    raw_bbox = bbox_from_vertices_raw(vertices)
    world_bbox = bbox_apply_transform(raw_bbox, scale, translate)

    appearance = data.get("appearance", {}) if isinstance(data.get("appearance"), dict) else {}
    materials = appearance.get("materials") if isinstance(appearance.get("materials"), list) else []
    textures = appearance.get("textures") if isinstance(appearance.get("textures"), list) else []
    vertices_texture = (
        appearance.get("vertices-texture") if isinstance(appearance.get("vertices-texture"), list) else []
    )

    missing_textures: list[str] = []
    if check_texture_files and path is not None:
        base_dir = path.parent
        for tex in textures:
            if not isinstance(tex, dict):
                continue
            img = tex.get("image")
            if isinstance(img, str):
                if not (base_dir / img).exists():
                    missing_textures.append(img)

    stats: dict[str, Any] = {
        "path": str(path) if path else None,
        "sha256": sha256_file(path) if path else None,
        "type": data.get("type"),
        "version": version,
        "transform": {"scale": scale, "translate": translate} if data.get("transform") else None,
        "cityobjects_total": len(cityobjects),
        "cityobjects_by_type": dict(by_type),
        "cityobjects_with_geometry": cityobjects_with_geometry,
        "cityobjects_with_attributes": cityobjects_with_attributes,
        "cityobjects_with_geographicalExtent": cityobjects_with_extent,
        "vertices_count": len(vertices),
        "vertices_bbox_raw": {"min": raw_bbox[0], "max": raw_bbox[1]} if raw_bbox else None,
        "vertices_bbox_world": {"min": world_bbox[0], "max": world_bbox[1]} if world_bbox else None,
        "geometries_total": geometries_total,
        "geometries_by_type": dict(geometries_by_type),
        "geometries_by_lod": dict(geometries_by_lod),
        "geometries_by_lod_type": dict(geometries_by_lod_type),
        "surface_primitives_total": surface_primitives_total,
        "rings_total": rings_total,
        "holes_total": holes_total,
        "vertex_references_total": vertex_refs_total,
        "semantic_defs_by_type": dict(semantic_defs_by_type),
        "semantic_assignments_total": semantic_assignments_total,
        "semantic_assignments_by_type": dict(semantic_assignments_by_type),
        "appearance_materials": len(materials),
        "appearance_textures": len(textures),
        "appearance_vertices_texture": len(vertices_texture),
        "missing_texture_files_count": len(missing_textures),
        "missing_texture_files_sample": missing_textures[:sample_limit],
        "geometries_with_texture": geometries_with_texture,
        "texture_themes": dict(texture_themes),
        "texture_value_entries_nonnull": texture_value_entries_nonnull,
    }
    return stats


def _pct_loss(a: int, b: int) -> float | None:
    if a <= 0:
        return None
    if b >= a:
        return 0.0
    return (a - b) / a


def _diff_counters(a: dict[str, Any], b: dict[str, Any]) -> dict[str, dict[str, Any]]:
    keys = set(a) | set(b)
    out: dict[str, dict[str, Any]] = {}
    for k in sorted(keys):
        av = int(a.get(k, 0) or 0)
        bv = int(b.get(k, 0) or 0)
        out[k] = {"a": av, "b": bv, "delta": bv - av, "loss_pct": _pct_loss(av, bv)}
    return out


def compare_cityjson(
    a: dict[str, Any],
    b: dict[str, Any],
    *,
    a_path: Path | None = None,
    b_path: Path | None = None,
    scan_geometry: bool = True,
    check_texture_files: bool = False,
    id_sample_limit: int = 20,
    texture_sample_limit: int = 15,
) -> dict[str, Any]:
    stats_a = compute_cityjson_stats(
        a, path=a_path, scan_geometry=scan_geometry, check_texture_files=check_texture_files, sample_limit=texture_sample_limit
    )
    stats_b = compute_cityjson_stats(
        b, path=b_path, scan_geometry=scan_geometry, check_texture_files=check_texture_files, sample_limit=texture_sample_limit
    )

    a_ids = a.get("CityObjects", {}) or {}
    b_ids = b.get("CityObjects", {}) or {}

    missing_in_b = []
    for k in a_ids.keys():
        if k not in b_ids:
            missing_in_b.append(k)
            if len(missing_in_b) >= id_sample_limit:
                break
    added_in_b = []
    for k in b_ids.keys():
        if k not in a_ids:
            added_in_b.append(k)
            if len(added_in_b) >= id_sample_limit:
                break

    bbox_a = stats_a.get("vertices_bbox_world")
    bbox_b = stats_b.get("vertices_bbox_world")
    bbox_delta_max_abs = None
    if bbox_a and bbox_b:
        deltas = []
        for i in range(3):
            deltas.append(abs(bbox_b["min"][i] - bbox_a["min"][i]))
            deltas.append(abs(bbox_b["max"][i] - bbox_a["max"][i]))
        bbox_delta_max_abs = max(deltas) if deltas else None

    diff: dict[str, Any] = {
        "a": stats_a,
        "b": stats_b,
        "delta": {
            "cityobjects_total": {"a": stats_a["cityobjects_total"], "b": stats_b["cityobjects_total"]},
            "vertices_count": {"a": stats_a["vertices_count"], "b": stats_b["vertices_count"]},
            "geometries_total": {"a": stats_a["geometries_total"], "b": stats_b["geometries_total"]},
            "surface_primitives_total": {
                "a": stats_a["surface_primitives_total"],
                "b": stats_b["surface_primitives_total"],
            },
            "holes_total": {"a": stats_a["holes_total"], "b": stats_b["holes_total"]},
            "appearance_textures": {"a": stats_a["appearance_textures"], "b": stats_b["appearance_textures"]},
            "appearance_vertices_texture": {
                "a": stats_a["appearance_vertices_texture"],
                "b": stats_b["appearance_vertices_texture"],
            },
            "bbox_delta_max_abs": bbox_delta_max_abs,
            "cityobjects_by_type": _diff_counters(stats_a["cityobjects_by_type"], stats_b["cityobjects_by_type"]),
            "geometries_by_lod_type": _diff_counters(stats_a["geometries_by_lod_type"], stats_b["geometries_by_lod_type"]),
            "semantic_defs_by_type": _diff_counters(stats_a["semantic_defs_by_type"], stats_b["semantic_defs_by_type"]),
            "semantic_assignments_by_type": _diff_counters(
                stats_a["semantic_assignments_by_type"], stats_b["semantic_assignments_by_type"]
            ),
        },
        "id_diff": {
            "missing_in_b_count": sum(1 for k in a_ids.keys() if k not in b_ids),
            "added_in_b_count": sum(1 for k in b_ids.keys() if k not in a_ids),
            "missing_in_b_sample": missing_in_b,
            "added_in_b_sample": added_in_b,
        },
    }
    return diff


def _print_counter_top(label: str, counter: dict[str, int], top: int = 12) -> None:
    items = sorted(counter.items(), key=lambda kv: (-kv[1], kv[0]))
    if not items:
        return
    print(f"{label}:")
    for k, v in items[:top]:
        print(f"  - {k}: {v}")
    if len(items) > top:
        print(f"  … ({len(items) - top} more)")


def print_stats(stats: dict[str, Any]) -> None:
    print(f"File: {stats.get('path')}")
    if stats.get("sha256"):
        print(f"SHA256: {stats['sha256']}")
    print(f"CityJSON: type={stats.get('type')} version={stats.get('version')}")
    print(f"CityObjects: {stats.get('cityobjects_total')} (with geometry: {stats.get('cityobjects_with_geometry')})")
    print(f"Vertices: {stats.get('vertices_count')}")
    bbox = stats.get("vertices_bbox_world")
    if bbox:
        print(f"BBox (world): min={bbox['min']} max={bbox['max']}")
    print(f"Geometries: {stats.get('geometries_total')}  Surfaces: {stats.get('surface_primitives_total')}")
    print(f"Semantics assignments: {stats.get('semantic_assignments_total')}")
    print(
        "Appearance: textures="
        f"{stats.get('appearance_textures')} vertices-texture={stats.get('appearance_vertices_texture')}"
    )
    if stats.get("missing_texture_files_count"):
        print(f"Missing texture files: {stats['missing_texture_files_count']} (sample: {stats['missing_texture_files_sample']})")
    _print_counter_top("CityObjects by type", stats.get("cityobjects_by_type", {}))
    _print_counter_top("Semantic assignments by type", stats.get("semantic_assignments_by_type", {}))


def print_diff(report: dict[str, Any]) -> None:
    a = report["a"]
    b = report["b"]
    print("=== A ===")
    print_stats(a)
    print("=== B ===")
    print_stats(b)
    print("=== Delta ===")
    print(f"CityObjects: {a['cityobjects_total']} -> {b['cityobjects_total']}")
    print(f"Vertices:    {a['vertices_count']} -> {b['vertices_count']}")
    print(f"Geometries:  {a['geometries_total']} -> {b['geometries_total']}")
    print(f"Surfaces:    {a['surface_primitives_total']} -> {b['surface_primitives_total']}")
    print(f"Holes:       {a['holes_total']} -> {b['holes_total']}")
    print(
        "Textures:    "
        f"{a['appearance_textures']} -> {b['appearance_textures']}  "
        f"(vertices-texture: {a['appearance_vertices_texture']} -> {b['appearance_vertices_texture']})"
    )
    if report["delta"].get("bbox_delta_max_abs") is not None:
        print(f"BBox max |Δ|: {report['delta']['bbox_delta_max_abs']}")
    id_diff = report.get("id_diff", {})
    print(
        f"ID diff: missing_in_B={id_diff.get('missing_in_b_count')} "
        f"added_in_B={id_diff.get('added_in_b_count')}"
    )
    if id_diff.get("missing_in_b_sample"):
        print(f"  missing sample: {id_diff['missing_in_b_sample']}")
    if id_diff.get("added_in_b_sample"):
        print(f"  added sample:   {id_diff['added_in_b_sample']}")

    sem_defs = report["delta"].get("semantic_defs_by_type", {})
    sem_assign = report["delta"].get("semantic_assignments_by_type", {})
    if any(k in sem_defs or k in sem_assign for k in ("Window", "Door")):
        print("Semantics (Window/Door):")
        for k in ("Window", "Door"):
            if k in sem_defs:
                row = sem_defs[k]
                print(f"  - defs {k}: {row['a']} -> {row['b']} (Δ {row['delta']})")
            if k in sem_assign:
                row = sem_assign[k]
                print(f"  - assigned {k}: {row['a']} -> {row['b']} (Δ {row['delta']})")

def render_comparison_markdown(report: dict[str, Any]) -> str:
    """Render the comparison report as a beautiful colorized Markdown document."""
    a = report["a"]
    b = report["b"]
    d = report["delta"]
    
    def status_icon(delta: int) -> str:
        if delta == 0: return "⚪"
        return "🟢" if delta > 0 else "🔴"

    def perc(a: int, b: int) -> str:
        if a == 0:
            return "N/A" if b == 0 else "+∞%"
        p = (b - a) / float(a) * 100.0
        return f"{p:+.1f}%"

    lines = [
        "# CityJSON Comparison Report",
        "",
        "## Summary",
        "",
        "| Metric | Base (A) | Export (B) | Delta | Change % | Status |",
        "| :--- | :--- | :--- | :--- | :--- | :--- |",
    ]
    
    metrics = [
        ("CityObjects", "cityobjects_total"),
        ("Vertices", "vertices_count"),
        ("Geometries", "geometries_total"),
        ("Surface Primitives", "surface_primitives_total"),
        ("Holes", "holes_total"),
        ("Textures", "appearance_textures"),
    ]
    
    for label, key in metrics:
        va, vb = d[key]["a"], d[key]["b"]
        delta = vb - va
        lines.append(f"| {label} | {va} | {vb} | {delta:+d} | {perc(va, vb)} | {status_icon(delta)} |")
        
    lines.extend([
        "",
        "## Object Type Changes",
        "",
        "| Type | Base | Export | Delta | Change % |",
        "| :--- | :--- | :--- | :--- | :--- |",
    ])
    
    for k, v in d.get("cityobjects_by_type", {}).items():
        lines.append(f"| {k} | {v['a']} | {v['b']} | {v['delta']:+d} | {perc(v['a'], v['b'])} |")
        
    lines.extend([
        "",
        "## Semantic Changes",
        "",
        "| Semantic | Base | Export | Delta | Change % | Status |",
        "| :--- | :--- | :--- | :--- | :--- | :--- |",
    ])
    
    sem_assign = d.get("semantic_assignments_by_type", {})
    # Expanded list for more detail
    for k in ["Window", "Door", "RoofSurface", "WallSurface", "GroundSurface", "ClosureSurface", "OuterCeilingSurface", "OuterFloorSurface"]:
        if k in sem_assign:
            v = sem_assign[k]
            delta = v["delta"]
            lines.append(f"| {k} | {v['a']} | {v['b']} | {delta:+d} | {perc(v['a'], v['b'])} | {status_icon(delta)} |")
            
    if report.get("id_diff", {}).get("missing_in_b_count"):
        lines.extend([
            "",
            "### Missing IDs (Data Loss ⚠️)",
            "",
            f"**Count:** {report['id_diff']['missing_in_b_count']}",
            "",
            "Sample:",
            ", ".join(f"`{i}`" for i in report['id_diff']['missing_in_b_sample'])
        ])

    return "\n".join(lines)
    parser = argparse.ArgumentParser(description="Compute CityJSON stats or diff two CityJSON files.")
    parser.add_argument("file_a", type=Path, help="First CityJSON file (or the only file for stats)")
    parser.add_argument("file_b", nargs="?", type=Path, help="Second CityJSON file (optional)")
    parser.add_argument("--out", type=Path, default=None, help="Write JSON report to this path")
    parser.add_argument(
        "--no-geometry",
        action="store_true",
        help="Skip deep geometry scanning (faster, but fewer metrics: no surfaces/semantics/texture usage)",
    )
    parser.add_argument(
        "--check-texture-files",
        action="store_true",
        help="Check that appearance texture image files exist next to the JSON file",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    a_path: Path = args.file_a
    b_path: Path | None = args.file_b
    scan_geometry = not args.no_geometry

    a = load_cityjson(a_path)
    if b_path is None:
        stats = compute_cityjson_stats(
            a, path=a_path, scan_geometry=scan_geometry, check_texture_files=args.check_texture_files
        )
        print_stats(stats)
        if args.out:
            args.out.parent.mkdir(parents=True, exist_ok=True)
            args.out.write_text(json.dumps(stats, indent=2), encoding="utf-8")
        return

    b = load_cityjson(b_path)
    report = compare_cityjson(
        a,
        b,
        a_path=a_path,
        b_path=b_path,
        scan_geometry=scan_geometry,
        check_texture_files=args.check_texture_files,
    )
    print_diff(report)
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(report, indent=2), encoding="utf-8")


if __name__ == "__main__":
    main()
