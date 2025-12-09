"""
Run an import/export cycle with CityJSONEditor inside Blender (headless-friendly).

Usage (inside repo):
  blender -b --python scripts/blender_test_cycle.py -- \
    --input /path/to/file.json \
    --output /tmp/exported.json \
    [--no-textures]

If bpy is not available (not running in Blender), the script exits with a message.
"""

import argparse
import sys
from pathlib import Path

try:
    import bpy  # type: ignore
except Exception:
    print("This script must be run inside Blender (bpy unavailable).")
    sys.exit(0)


def parse_args():
    argv = sys.argv
    if "--" in argv:
        argv = argv[argv.index("--") + 1 :]
    parser = argparse.ArgumentParser(description="Headless CityJSON import/export cycle in Blender")
    parser.add_argument("--input", required=True, type=Path, help="CityJSON file to import")
    parser.add_argument("--output", required=True, type=Path, help="Path to export CityJSON")
    parser.add_argument("--no-textures", action="store_true", help="Disable texture import/export")
    return parser.parse_args(argv)


def main():
    args = parse_args()
    if not args.input.exists():
        print(f"Input file not found: {args.input}")
        sys.exit(1)

    # Import
    res = bpy.ops.cityjson.import_file(filepath=str(args.input), texture_setting=not args.no_textures)
    if "FINISHED" not in res:
        print(f"Import failed: {res}")
        sys.exit(1)

    # Export
    res = bpy.ops.cityjson.export_file(
        filepath=str(args.output), check_existing=False, texture_setting=not args.no_textures
    )
    if "FINISHED" not in res:
        print(f"Export failed: {res}")
        sys.exit(1)

    print(f"Cycle completed. Exported to: {args.output}")


if __name__ == "__main__":
    main()
