# Refactor Summary (January 2026)

## Overview

- Major refactor to support LOD3 window placement as semantic faces (not separate objects) in Blender for CityJSON export.
- Improved semantic surface handling, attribute preservation, and robust logging.
- Bug fixes for semantic index persistence, ID property serialization, and modal operator state.

## Key Changes

- **Window Placement**: Windows are now added as faces with correct semantic type and parent relationships.
- **Calculate Semantic**: Operator preserves window/door faces and their attributes.
- **ID Property Fix**: Custom Blender properties are converted to plain dicts for export.
- **Logging**: Added detailed logging for all critical steps.
- **Cursor Bug**: Fixed modal operator cursor constraint issue.

## Main Files Modified

- `core/lod3_operators.py`: Window placement operator, semantic assignment, logging, bug fixes.
- `core/lod3_utils.py`: Math helpers, face validation.
- `core/ObjectMenu.py`: Calculate Semantic improvements, attribute preservation.
- `core/schema.py`, `core/properties.py`: Constants and settings.
- `__init__.py`: Operator registration.

## Workflow

1. Import LOD2 model.
2. Select face, run window operator (click-drag-click).
3. Run Calculate Semantic.
4. Export CityJSON (windows as semantic faces).

## Branch

- All changes on `feature/lod3-window-improvements`.

## Notes

- Old documentation backed up as `refactor_old.md`.
- For further improvements, see TODOs in code.
