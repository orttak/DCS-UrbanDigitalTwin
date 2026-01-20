# Task 1–2–3 Report

**Overall Validation Status:** 🔴 4 failures

## Inputs

| File | Declared Version | Notes |
|---|---|---|
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json | 2.0 |  |
| data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | 2.0 |  |

## Version Normalization (for comparisons)

| File | Comparison Path | Note |
|---|---|---|
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json | data\\mert_test_lod0-3_openings_cityjson2.0.city.json | already v2.0 |
| data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | already v2.0 |

Notes:
- Validation always uses the official CityJSON v2.0 schemas; v1.1 inputs are upgraded to a temporary v2.0 copy for schema checks.
- Comparisons can optionally run on v2.0 normalized copies so version differences don't dominate the summary.

## Validation Matrix

| File | Type | Validator | Result | Details | Report |
|---|---|---|---|---|---|
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json | CityJSON | cjio validate | <span style="color: #d1242f; font-weight: 600">FAIL</span> | pyo3_runtime.PanicException: called `Result::unwrap()` on an `Err` value: Error("invalid type: null, expected usize", line: 0, column: 0) | dev\\test\\reports\\mert_test_lod0-3_openings_cityjson2.0.city.cjio_validate.txt |
| | | | | **Cmd:** `D:\\DCS\\.venv-win\\Scripts\\cjio.exe D:\\DCS\\data\\mert_test_lod0-3_openings_cityjson2.0.city.json validate` | |
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json | CityJSON | cjvalpy | <span style="color: #d1242f; font-weight: 600">FAIL</span> | pyo3_runtime.PanicException: called `Result::unwrap()` on an `Err` value: Error("invalid type: null, expected usize", line: 0, column: 0) | dev\\test\\reports\\mert_test_lod0-3_openings_cityjson2.0.city.cjvalpy_validate.txt |
| | | | | **Cmd:** `D:\\DCS\\.venv-win\\Scripts\\python.exe -c '...' D:\\DCS\\data\\mert_test_lod0-3_openings_cityjson2.0.city.json` | |
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |
| | | | | **Cmd:** `prepare_cityjson_for_import(mert_test_lod0-3_openings_cityjson2.0.city.json, allow_textures=True)` | |
| data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | CityJSON | cjio validate | <span style="color: #d1242f; font-weight: 600">FAIL</span> | pyo3_runtime.PanicException: called `Result::unwrap()` on an `Err` value: Error("invalid type: null, expected usize", line: 0, column: 0) | dev\\test\\reports\\mert_test_lod0-3_openings_cityjson2.0.export.city.cjio_validate.txt |
| | | | | **Cmd:** `D:\\DCS\\.venv-win\\Scripts\\cjio.exe D:\\DCS\\data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json validate` | |
| data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | CityJSON | cjvalpy | <span style="color: #d1242f; font-weight: 600">FAIL</span> | pyo3_runtime.PanicException: called `Result::unwrap()` on an `Err` value: Error("invalid type: null, expected usize", line: 0, column: 0) | dev\\test\\reports\\mert_test_lod0-3_openings_cityjson2.0.export.city.cjvalpy_validate.txt |
| | | | | **Cmd:** `D:\\DCS\\.venv-win\\Scripts\\python.exe -c '...' D:\\DCS\\data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json` | |
| data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |
| | | | | **Cmd:** `prepare_cityjson_for_import(mert_test_lod0-3_openings_cityjson2.0.export.city.json, allow_textures=True)` | |

## Comparison Summary

| Pair | Version | LoD | CityObjects | Building | BuildingPart | BuildingInstallation | WinDef | WinFaces | DoorDef | DoorFaces | Holes | Vertices | Surfaces | BBoxΔmax | ID Δ | Diff Report |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json -> data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | 2.0->2.0 | 1.2->0 | 1->1 (0) | 1->1 (0) |  |  |  |  | 1->0 (<span style="color: #d1242f; font-weight: 600">-1</span>) | 1->0 (<span style="color: #d1242f; font-weight: 600">-1</span>) | 0->0 (0) | 40->40 (0) | 24->25 (<span style="color: #1a7f37; font-weight: 600">+1</span>) | 0.0 | -0/+0 | dev\\test\\reports\\mert_test_lod0-3_openings_cityjson2.0.city__vs__mert_test_lod0-3_openings_cityjson2.0.export.city.diff.json |

## Key Findings

- `data\mert_test_lod0-3_openings_cityjson2.0.city.json -> data\mert_test_lod0-3_openings_cityjson2.0.export.city.json`: Dominant LoD changed `1.2` → `0`.

## Fix Hints

### data\mert_test_lod0-3_openings_cityjson2.0.city.json

- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjio validate`: pyo3_runtime.PanicException: called `Result::unwrap()` on an `Err` value: Error("invalid type: null, expected usize", line: 0, column: 0)
- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjvalpy`: pyo3_runtime.PanicException: called `Result::unwrap()` on an `Err` value: Error("invalid type: null, expected usize", line: 0, column: 0)

### data\mert_test_lod0-3_openings_cityjson2.0.export.city.json

- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjio validate`: pyo3_runtime.PanicException: called `Result::unwrap()` on an `Err` value: Error("invalid type: null, expected usize", line: 0, column: 0)
- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjvalpy`: pyo3_runtime.PanicException: called `Result::unwrap()` on an `Err` value: Error("invalid type: null, expected usize", line: 0, column: 0)


---

# CityJSON Comparison Report

## Summary

| Metric | Base (A) | Export (B) | Delta | Change % | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| CityObjects | 1 | 1 | +0 | +0.0% | ⚪ |
| Vertices | 40 | 40 | +0 | +0.0% | ⚪ |
| Geometries | 3 | 4 | +1 | +33.3% | 🟢 |
| Surface Primitives | 24 | 25 | +1 | +4.2% | 🟢 |
| Holes | 0 | 0 | +0 | N/A | ⚪ |
| Textures | 0 | 0 | +0 | N/A | ⚪ |

## Object Type Changes

| Type | Base | Export | Delta | Change % |
| :--- | :--- | :--- | :--- | :--- |
| Building | 1 | 1 | +0 | +0.0% |

## Semantic Changes

| Semantic | Base | Export | Delta | Change % | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Door | 1 | 0 | -1 | -100.0% | 🔴 |
| RoofSurface | 2 | 0 | -2 | -100.0% | 🔴 |
| WallSurface | 5 | 0 | -5 | -100.0% | 🔴 |
| GroundSurface | 3 | 11 | +8 | +266.7% | 🟢 |