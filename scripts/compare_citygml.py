#!/usr/bin/env python3
"""
CityGML stats + diff helper (no external deps).

This is meant for *roundtrip* checks (import/export via 3DCityDB) where files won't be byte-identical
(different ordering/IDs/formatting), but we still want to quantify what changed.

Examples:
  # Stats for one file
  python3 scripts/compare_citygml.py data/FZK-Haus-LoD-all-KIT-IAI-KHH-B36-V1.gml

  # Diff two files + JSON report
  python3 scripts/compare_citygml.py in.gml out.gml --out gml_diff.json
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import xml.etree.ElementTree as ET
from collections import Counter
from pathlib import Path
from typing import Any


LOD_RE = re.compile(r"^lod[0-9]")

KEY_TAGS = {
    # Core
    "CityModel",
    "cityObjectMember",
    "boundedBy",
    "Envelope",
    "lowerCorner",
    "upperCorner",
    # Buildings + openings
    "Building",
    "BuildingPart",
    "BuildingInstallation",
    "Door",
    "Window",
    # Boundary surfaces (bldg module)
    "WallSurface",
    "RoofSurface",
    "GroundSurface",
    "ClosureSurface",
    "OuterCeilingSurface",
    "OuterFloorSurface",
    "InteriorWallSurface",
    "CeilingSurface",
    "FloorSurface",
    # Geometry (GML)
    "pos",
    "posList",
    "Polygon",
    "LinearRing",
    "MultiSurface",
    "CompositeSurface",
    "Solid",
    "CompositeSolid",
    "MultiSolid",
    # Appearance module
    "Appearance",
    "surfaceDataMember",
    "ParameterizedTexture",
    "GeoreferencedTexture",
    "X3DMaterial",
    "imageURI",
    "textureCoordinates",
}


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as fh:
        for chunk in iter(lambda: fh.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def localname(tag: str) -> str:
    if tag.startswith("{"):
        return tag.split("}", 1)[1]
    return tag


def _parse_corner(text: str | None) -> list[float] | None:
    if not text:
        return None
    parts = text.strip().split()
    if len(parts) < 2:
        return None
    try:
        # CityGML envelopes are usually 3D, but some datasets may be 2D.
        vals = [float(p) for p in parts[:3]]
        if len(vals) == 2:
            vals.append(0.0)
        return vals
    except Exception:
        return None


def compute_citygml_stats(path: Path) -> dict[str, Any]:
    counts_all: Counter[str] = Counter()
    counts_key: Counter[str] = Counter()
    counts_lod: Counter[str] = Counter()
    total_elements = 0
    envelopes_count = 0
    bbox_min = None
    bbox_max = None
    root_tag = None

    context = ET.iterparse(path, events=("start", "end"))
    for event, elem in context:
        if event == "start" and root_tag is None:
            root_tag = elem.tag
        if event != "end":
            continue

        total_elements += 1
        name = localname(elem.tag)
        counts_all[name] += 1
        if name in KEY_TAGS:
            counts_key[name] += 1
        if LOD_RE.match(name):
            counts_lod[name] += 1

        if name == "Envelope":
            envelopes_count += 1
        if name == "lowerCorner":
            corner = _parse_corner(elem.text)
            if corner is not None:
                if bbox_min is None:
                    bbox_min = corner
                else:
                    bbox_min = [min(bbox_min[i], corner[i]) for i in range(3)]
        if name == "upperCorner":
            corner = _parse_corner(elem.text)
            if corner is not None:
                if bbox_max is None:
                    bbox_max = corner
                else:
                    bbox_max = [max(bbox_max[i], corner[i]) for i in range(3)]

        elem.clear()

    stats: dict[str, Any] = {
        "path": str(path),
        "sha256": sha256_file(path),
        "root_tag": root_tag,
        "total_elements": total_elements,
        "key_counts": dict(counts_key),
        "lod_counts": dict(counts_lod),
        "envelopes_count": envelopes_count,
        "bbox_envelope_global": {"lowerCorner": bbox_min, "upperCorner": bbox_max} if bbox_min or bbox_max else None,
        "top_tags": dict(counts_all.most_common(25)),
    }
    return stats


def _pct_loss(a: int, b: int) -> float | None:
    if a <= 0:
        return None
    if b >= a:
        return 0.0
    return (a - b) / a


def diff_counts(a: dict[str, int], b: dict[str, int]) -> dict[str, dict[str, Any]]:
    keys = set(a) | set(b)
    out: dict[str, dict[str, Any]] = {}
    for k in sorted(keys):
        av = int(a.get(k, 0) or 0)
        bv = int(b.get(k, 0) or 0)
        out[k] = {"a": av, "b": bv, "delta": bv - av, "loss_pct": _pct_loss(av, bv)}
    return out


def compare_citygml(a_path: Path, b_path: Path) -> dict[str, Any]:
    a = compute_citygml_stats(a_path)
    b = compute_citygml_stats(b_path)
    report: dict[str, Any] = {
        "a": a,
        "b": b,
        "delta": {
            "total_elements": {"a": a["total_elements"], "b": b["total_elements"]},
            "key_counts": diff_counts(a.get("key_counts", {}), b.get("key_counts", {})),
            "lod_counts": diff_counts(a.get("lod_counts", {}), b.get("lod_counts", {})),
        },
    }
    return report


def print_stats(stats: dict[str, Any]) -> None:
    print(f"File: {stats['path']}")
    print(f"SHA256: {stats['sha256']}")
    print(f"Root tag: {stats.get('root_tag')}")
    print(f"Total elements: {stats.get('total_elements')}")
    bbox = stats.get("bbox_envelope_global")
    if bbox:
        print(
            f"Envelope (global, from {stats.get('envelopes_count', 0)} Envelope tags): "
            f"lower={bbox.get('lowerCorner')} upper={bbox.get('upperCorner')}"
        )
    key_counts = stats.get("key_counts", {})
    if key_counts:
        print("Key counts:")
        for k in sorted(KEY_TAGS):
            if k in key_counts:
                print(f"  - {k}: {key_counts[k]}")
    lod_counts = stats.get("lod_counts", {})
    if lod_counts:
        print("LoD tags:")
        for k, v in sorted(lod_counts.items()):
            print(f"  - {k}: {v}")


def print_diff(report: dict[str, Any]) -> None:
    print("=== A ===")
    print_stats(report["a"])
    print("=== B ===")
    print_stats(report["b"])
    print("=== Delta ===")
    print(f"Total elements: {report['a']['total_elements']} -> {report['b']['total_elements']}")
    key = report["delta"].get("key_counts", {})
    interesting = ("Building", "BuildingPart", "Door", "Window", "Appearance", "imageURI")
    print("Selected key deltas:")
    for k in interesting:
        if k in key:
            row = key[k]
            print(f"  - {k}: {row['a']} -> {row['b']} (Δ {row['delta']})")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Compute CityGML stats or diff two CityGML files.")
    parser.add_argument("file_a", type=Path, help="First CityGML file (or only file for stats)")
    parser.add_argument("file_b", nargs="?", type=Path, help="Second CityGML file (optional)")
    parser.add_argument("--out", type=Path, default=None, help="Write JSON report to this path")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    a_path: Path = args.file_a
    b_path: Path | None = args.file_b

    if b_path is None:
        stats = compute_citygml_stats(a_path)
        print_stats(stats)
        if args.out:
            args.out.parent.mkdir(parents=True, exist_ok=True)
            args.out.write_text(json.dumps(stats, indent=2), encoding="utf-8")
        return

    report = compare_citygml(a_path, b_path)
    print_diff(report)
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(report, indent=2), encoding="utf-8")


if __name__ == "__main__":
    import sys
    import os
    if os.name == "nt":
        sys.stdout.reconfigure(encoding="utf-8")
    main()
