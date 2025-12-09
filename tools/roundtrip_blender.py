"""
Headless roundtrip regression for CityJSONEditor.

Usage:
blender -b --factory-startup --python tools/roundtrip_blender.py -- --input data/mert_test_lod0-3_openings_cityjson2.0.city.json --output /tmp/out.json --report /tmp/report.json
"""

import argparse
import json
import os
import sys
from pathlib import Path

import bpy


def parse_args():
    if "--" in sys.argv:
        argv = sys.argv[sys.argv.index("--") + 1 :]
    else:
        argv = []
    parser = argparse.ArgumentParser(description="CityJSONEditor roundtrip test")
    parser.add_argument("--input", required=True, help="Input CityJSON file")
    parser.add_argument("--output", required=True, help="Roundtripped output path")
    parser.add_argument("--report", default="report.json", help="Report path")
    parser.add_argument("--textures", action="store_true", help="Import/export textures")
    return parser.parse_args(argv)


def ensure_addon():
    root = Path(__file__).resolve().parent.parent
    if str(root) not in sys.path:
        sys.path.append(str(root))
    import CityJSONEditor as cje

    cje.register()
    return cje


def run_roundtrip(input_path: Path, output_path: Path, use_textures: bool):
    bpy.ops.cityjson.import_file(
        filepath=str(input_path),
        texture_setting=use_textures,
        lod_filter="",
        lod_strategy="ALL",
    )
    bpy.ops.cityjson.export_file(
        filepath=str(output_path),
        texture_setting=use_textures,
        skip_failed_exports=False,
        patch_baseline=False,
    )


def inspect(file_path: Path):
    data = json.loads(file_path.read_text(encoding="utf-8"))
    cityobjects = data.get("CityObjects") or {}
    report = {
        "has_cityobjects": bool(cityobjects),
        "lods": {},
        "doors_windows_present": False,
        "ids": list(cityobjects.keys()),
    }
    for co_id, co in cityobjects.items():
        lods = []
        for geom in co.get("geometry") or []:
            lods.append(geom.get("lod"))
            sem = (geom.get("semantics") or {})
            surfaces = sem.get("surfaces") or []
            types = {s.get("type") for s in surfaces if isinstance(s, dict)}
            if "Door" in types or "Window" in types:
                report["doors_windows_present"] = True
        report["lods"][co_id] = sorted({float(l) if l is not None else 0 for l in lods})
    return report


def main():
    args = parse_args()
    input_path = Path(args.input).resolve()
    output_path = Path(args.output).resolve()
    report_path = Path(args.report).resolve()

    ensure_addon()
    run_roundtrip(input_path, output_path, args.textures)
    report = inspect(output_path)
    report_path.write_text(json.dumps(report, indent=2), encoding="utf-8")

    # basic assertions for CI
    ok = True
    if not report["has_cityobjects"]:
        ok = False
    # expect four LoDs for the test asset
    expected_lods = {0.0, 1.2, 2.2, 3.0}
    for lods in report["lods"].values():
        if not expected_lods.issubset(set(lods)):
            ok = False
    if not report["doors_windows_present"]:
        ok = False
    if not ok:
        print(f"[roundtrip] FAILED: {report}")
        sys.exit(1)
    print(f"[roundtrip] SUCCESS: {report}")


if __name__ == "__main__":
    main()
