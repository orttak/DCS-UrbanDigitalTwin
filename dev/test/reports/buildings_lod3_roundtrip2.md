# Task 1–2–3 Report

**Overall Validation Status:** 🟡 2 warnings

## Inputs

| File | Declared Version | Notes |
|---|---|---|
| data\\export\\BuildingsLOD3.city.json | 2.0 |  |
| data\\export\\BuildingsLOD3.city-export.json | 2.0 |  |

## Version Normalization (for comparisons)

| File | Comparison Path | Note |
|---|---|---|
| data\\export\\BuildingsLOD3.city.json | data\\export\\BuildingsLOD3.city.json | already v2.0 |
| data\\export\\BuildingsLOD3.city-export.json | data\\export\\BuildingsLOD3.city-export.json | already v2.0 |

Notes:
- Validation always uses the official CityJSON v2.0 schemas; v1.1 inputs are upgraded to a temporary v2.0 copy for schema checks.
- Comparisons can optionally run on v2.0 normalized copies so version differences don't dominate the summary.

## Validation Matrix

| File | Type | Validator | Result | Details | Report |
|---|---|---|---|---|---|
| data\\export\\BuildingsLOD3.city.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok | dev\\test\\reports\\BuildingsLOD3.city.cjio_validate.txt |
| | | | | **Cmd:** `D:\\DCS\\.venv-win\\Scripts\\cjio.exe D:\\DCS\\data\\export\\BuildingsLOD3.city.json validate` | |
| data\\export\\BuildingsLOD3.city.json | CityJSON | cjvalpy | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok | dev\\test\\reports\\BuildingsLOD3.city.cjvalpy_validate.txt |
| | | | | **Cmd:** `D:\\DCS\\.venv-win\\Scripts\\python.exe -c '...' D:\\DCS\\data\\export\\BuildingsLOD3.city.json` | |
| data\\export\\BuildingsLOD3.city.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |
| | | | | **Cmd:** `prepare_cityjson_for_import(BuildingsLOD3.city.json, allow_textures=True)` | |
| data\\export\\BuildingsLOD3.city-export.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok | dev\\test\\reports\\BuildingsLOD3.city-export.cjio_validate.txt |
| | | | | **Cmd:** `D:\\DCS\\.venv-win\\Scripts\\cjio.exe D:\\DCS\\data\\export\\BuildingsLOD3.city-export.json validate` | |
| data\\export\\BuildingsLOD3.city-export.json | CityJSON | cjvalpy | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok | dev\\test\\reports\\BuildingsLOD3.city-export.cjvalpy_validate.txt |
| | | | | **Cmd:** `D:\\DCS\\.venv-win\\Scripts\\python.exe -c '...' D:\\DCS\\data\\export\\BuildingsLOD3.city-export.json` | |
| data\\export\\BuildingsLOD3.city-export.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |
| | | | | **Cmd:** `prepare_cityjson_for_import(BuildingsLOD3.city-export.json, allow_textures=True)` | |

## Comparison Summary

| Pair | Version | LoD | CityObjects | Building | BuildingPart | BuildingInstallation | WinDef | WinFaces | DoorDef | DoorFaces | Holes | Vertices | Surfaces | BBoxΔmax | ID Δ | Diff Report |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| data\\export\\BuildingsLOD3.city.json -> data\\export\\BuildingsLOD3.city-export.json | 2.0->2.0 | 3->3 | 20->20 (0) | 16->16 (0) |  | 4->4 (0) | 480->480 (0) | 480->480 (0) | 16->16 (0) | 16->16 (0) | 509->509 (0) | 4152->4152 (0) | 2577->2577 (0) | 0.0 | -0/+0 | dev\\test\\reports\\BuildingsLOD3.city__vs__BuildingsLOD3.city-export.diff.json |

## Key Findings

_No automatic findings._

## Fix Hints

_No fix hints (no FAIL rows)._

---

# CityJSON Comparison Report

## Summary

| Metric | Base (A) | Export (B) | Delta | Change % | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| CityObjects | 20 | 20 | +0 | +0.0% | ⚪ |
| Vertices | 4152 | 4152 | +0 | +0.0% | ⚪ |
| Geometries | 17 | 17 | +0 | +0.0% | ⚪ |
| Surface Primitives | 2577 | 2577 | +0 | +0.0% | ⚪ |
| Holes | 509 | 509 | +0 | +0.0% | ⚪ |
| Textures | 0 | 0 | +0 | N/A | ⚪ |

## Object Type Changes

| Type | Base | Export | Delta | Change % |
| :--- | :--- | :--- | :--- | :--- |
| Building | 16 | 16 | +0 | +0.0% |
| BuildingInstallation | 4 | 4 | +0 | +0.0% |

## Semantic Changes

| Semantic | Base | Export | Delta | Change % | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Window | 480 | 480 | +0 | +0.0% | ⚪ |
| Door | 16 | 16 | +0 | +0.0% | ⚪ |
| RoofSurface | 55 | 55 | +0 | +0.0% | ⚪ |
| WallSurface | 2009 | 2009 | +0 | +0.0% | ⚪ |
| GroundSurface | 16 | 16 | +0 | +0.0% | ⚪ |
| OuterFloorSurface | 1 | 1 | +0 | +0.0% | ⚪ |