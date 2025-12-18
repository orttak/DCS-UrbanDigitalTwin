#!/usr/bin/env python3
"""
Patch cjio's `validate` implementation to work with cjvalpy>=0.4.

Why this exists
---------------
cjio v0.10.1 currently calls `cjvalpy.CJValidator(json_string)` which fails with:
  Can't extract `str` to `Vec`

The current cjvalpy API expects a list of strings where the first element is the
CityJSON document (serialized), followed by 0..n Extension JSON schemas.

This script patches the installed cjio in-place (site-packages) so that:
  - it no longer constructs CJValidator with a single string
  - it includes the CityJSON JSON string in the list passed to CJValidator

Usage
-----
  # Run inside the venv where cjio is installed (recommended)
  . .venv/bin/activate
  python3 scripts/fix_cjio_validate.py

  # Verify
  cjio data/Vienna_102081.city.json validate
"""

from __future__ import annotations

import sys
from pathlib import Path


def patch_cityjson_py(path: Path) -> tuple[bool, str]:
    src = path.read_text(encoding="utf-8")

    # Target the exact buggy snippet in cjio v0.10.1.
    old = (
        "        val = cjvalpy.CJValidator(json.dumps(self.j))\n"
        "        # -- fetch extensions from the URLs given\n"
        "        js = []\n"
    )
    new = (
        "        # -- fetch extensions from the URLs given\n"
        "        js = [json.dumps(self.j)]\n"
    )

    if new in src:
        return False, "Already patched."
    if old not in src:
        return False, "Did not find expected cjio v0.10.1 validate snippet; refusing to patch."

    patched = src.replace(old, new)
    path.write_text(patched, encoding="utf-8")
    return True, "Patched cjio validate() to use cjvalpy>=0.4 API."


def main() -> None:
    try:
        import cjio.cityjson  # type: ignore
    except Exception as exc:
        raise SystemExit(f"Could not import cjio from {sys.executable}: {exc}")

    cityjson_py = Path(cjio.cityjson.__file__).resolve()
    changed, msg = patch_cityjson_py(cityjson_py)
    print(msg)
    print(f"File: {cityjson_py}")
    if not changed and "refusing" in msg.lower():
        raise SystemExit(2)


if __name__ == "__main__":
    main()

