bl_info = {
    "name": "CityDB - CityJSON Bridge",
    "author": "Mert Cakir",
    "version": (1, 0, 0),
    "blender": (3, 5, 0),
    "location": "View3D > Sidebar > CityDB",
    "description": "Fetch CityJSON from CityDB via docker, load it with CityJSONEditor, and push edits back.",
    "category": "Import-Export",
}

import shlex
import subprocess
from pathlib import Path
from typing import List

import bpy
from bpy.props import (
    BoolProperty,
    IntProperty,
    PointerProperty,
    StringProperty,
)
from bpy.types import (
    AddonPreferences,
    Operator,
    Panel,
    PropertyGroup,
)

HELP_TEXT = [
    "1) Set the workspace folder (mounted as /input in docker).",
    "2) \"Fetch from CityDB\" exports low-LoD (overview) CityJSON and loads it.",
    "3) Select a building and run \"Load high LoD for selection\" to fetch detailed geometry.",
    "4) Edit using CityJSONEditor tools.",
    "5) \"Export + Push\" writes CityJSON and imports it into CityDB.",
    "Use \"Load defaults\" / \"Save as defaults\" to manage presets.",
]

DEFAULT_WORKDIR = Path.home() / "citydb_bridge"


def _addon_prefs() -> AddonPreferences | None:
    try:
        prefs = bpy.context.preferences
    except Exception:
        return None
    addon = prefs.addons.get(__name__) if prefs else None
    return addon.preferences if addon else None


def _normalize_path_for_docker(path: Path) -> str:
    return path.as_posix()


def _ensure_dirs(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)


def _mask_password(cmd: List[str], password: str) -> str:
    masked = []
    for part in cmd:
        if password and password in part:
            masked.append(part.replace(password, "******"))
        else:
            masked.append(part)
    return " ".join(shlex.quote(p) for p in masked)


def _peek_file(path: Path, max_bytes: int = 256) -> str:
    if not path.exists():
        return "<missing>"
    try:
        with path.open("rb") as fh:
            data = fh.read(max_bytes)
        return data.decode("utf-8", errors="replace")
    except Exception as exc:
        return f"<unreadable: {exc}>"


def _ensure_json_file(path: Path) -> tuple[bool, str]:
    if not path.exists():
        return False, f"File does not exist: {path}"
    text = _peek_file(path)
    stripped = text.lstrip()
    if not stripped.startswith("{"):
        hint = ""
        if stripped.startswith("<"):
            hint = " Looks like XML/GML; export must be CityJSON."
        return False, f"File is not JSON (first bytes: {text[:60]!r}) at {path}.{hint}"
    return True, ""


def _validate_cityjson(path: Path) -> tuple[bool, str]:
    ok, msg = _ensure_json_file(path)
    if not ok:
        return ok, msg
    try:
        import json
        with path.open("r", encoding="utf-8") as fh:
            json.load(fh)
    except json.JSONDecodeError as exc:
        prefix = _peek_file(path, max_bytes=512)
        hint = ""
        if prefix.lstrip().startswith("<"):
            hint = " Detected XML/GML; ensure you exported CityJSON, not CityGML."
        return (
            False,
            f"Invalid CityJSON ({path}): {exc.msg} at line {exc.lineno} col {exc.colno}. "
            f"{hint}Preview: {prefix[:120]!r}",
        )
    except Exception as exc:  # pragma: no cover - defensive
        return False, f"Could not read CityJSON ({path}): {exc}"
    return True, ""


def _require_cityjson_editor() -> bool:
    return hasattr(bpy.ops, "cityjson") and hasattr(bpy.ops.cityjson, "import_file") and hasattr(
        bpy.ops.cityjson, "export_file"
    )


class CityDBBridgePreferences(AddonPreferences):
    bl_idname = __name__

    docker_image: StringProperty(
        name="Docker image",
        description="citydb-tool docker image",
        default="3dcitydb/citydb-tool:latest",
    )
    docker_network: StringProperty(
        name="Docker network",
        description="Docker network to attach to (empty to skip)",
        default="dcs_default",
    )
    default_workdir: StringProperty(
        name="Workspace folder",
        description="Local folder mounted into docker as /input",
        subtype="DIR_PATH",
        default=str(DEFAULT_WORKDIR),
    )
    default_import_subdir: StringProperty(
        name="Fetch subfolder",
        description="Relative folder for files exported from CityDB",
        default="from_db",
    )
    default_import_filename: StringProperty(
        name="Fetch filename",
        description="CityJSON filename fetched from CityDB",
        default="from_citydb.json",
    )
    default_high_import_filename: StringProperty(
        name="High-LoD filename",
        description="CityJSON filename for per-building high-LoD fetch",
        default="selected_high.json",
    )
    default_export_subdir: StringProperty(
        name="Push subfolder",
        description="Relative folder for files exported from Blender",
        default="to_db",
    )
    default_export_filename: StringProperty(
        name="Push filename",
        description="CityJSON filename written before sending to CityDB",
        default="to_citydb.json",
    )
    db_host: StringProperty(
        name="DB host",
        description="3DCityDB host",
        default="citydb",
    )
    db_port: IntProperty(
        name="DB port",
        description="3DCityDB port",
        default=5432,
    )
    db_name: StringProperty(
        name="DB name",
        description="3DCityDB database name",
        default="citydb",
    )
    db_schema: StringProperty(
        name="DB schema",
        description="Optional schema name",
        default="",
    )
    db_user: StringProperty(
        name="DB user",
        description="3DCityDB username",
        default="postgres",
    )
    db_password: StringProperty(
        name="DB password",
        description="3DCityDB password",
        subtype="PASSWORD",
        default="postgres",
    )
    low_lods: StringProperty(
        name="Low LoDs",
        description="LoDs used for the overview fetch (comma-separated)",
        default="0,1",
    )
    high_lods: StringProperty(
        name="High LoDs",
        description="LoDs used when fetching a selected building",
        default="2,3",
    )
    high_sql_template: StringProperty(
        name="High-LoD SQL filter",
        description="SQL filter template; {gmlid} is replaced with the selected object's gmlid",
        default="citydb.cityobject.gmlid = '{gmlid}'",
    )
    replace_on_high: BoolProperty(
        name="Replace selection on high-LoD load",
        description="Delete selected objects before loading detailed geometry",
        default=True,
    )
    extra_export_args: StringProperty(
        name="Extra export args",
        description="Additional citydb-tool export args (advanced)",
        default="",
    )
    extra_import_args: StringProperty(
        name="Extra import args",
        description="Additional citydb-tool import args (advanced)",
        default="",
    )

    def draw(self, context):
        layout = self.layout
        col = layout.column()
        col.label(text="Defaults (shown in the panel):")
        col.prop(self, "docker_image")
        col.prop(self, "docker_network")
        col.prop(self, "default_workdir")
        col.prop(self, "default_import_subdir")
        col.prop(self, "default_import_filename")
        col.prop(self, "default_high_import_filename")
        col.prop(self, "default_export_subdir")
        col.prop(self, "default_export_filename")
        col.prop(self, "db_host")
        col.prop(self, "db_port")
        col.prop(self, "db_name")
        col.prop(self, "db_schema")
        col.prop(self, "db_user")
        col.prop(self, "db_password")
        col.prop(self, "low_lods")
        col.prop(self, "high_lods")
        col.prop(self, "high_sql_template")
        col.prop(self, "replace_on_high")
        col.prop(self, "extra_export_args")
        col.prop(self, "extra_import_args")
        col.label(text="Save Blender preferences to persist these defaults.")


class CityDBBridgeSettings(PropertyGroup):
    working_dir: StringProperty(
        name="Workspace folder",
        subtype="DIR_PATH",
        default=str(DEFAULT_WORKDIR),
    )
    import_subdir: StringProperty(
        name="Fetch subfolder",
        default="from_db",
    )
    import_filename: StringProperty(
        name="Fetch filename",
        default="from_citydb.json",
    )
    high_import_filename: StringProperty(
        name="High-LoD filename",
        default="selected_high.json",
    )
    export_subdir: StringProperty(
        name="Push subfolder",
        default="to_db",
    )
    export_filename: StringProperty(
        name="Push filename",
        default="to_citydb.json",
    )
    db_host: StringProperty(
        name="DB host",
        default="citydb",
    )
    db_port: IntProperty(
        name="DB port",
        default=5432,
    )
    db_name: StringProperty(
        name="DB name",
        default="citydb",
    )
    db_schema: StringProperty(
        name="DB schema",
        default="",
    )
    db_user: StringProperty(
        name="DB user",
        default="postgres",
    )
    db_password: StringProperty(
        name="DB password",
        subtype="PASSWORD",
        default="postgres",
    )
    low_lods: StringProperty(
        name="Low LoDs",
        default="0,1",
    )
    high_lods: StringProperty(
        name="High LoDs",
        default="2,3",
    )
    high_sql_template: StringProperty(
        name="High-LoD SQL filter",
        default="citydb.cityobject.gmlid = '{gmlid}'",
    )
    replace_on_high: BoolProperty(
        name="Replace selection on high-LoD load",
        default=True,
    )
    docker_network: StringProperty(
        name="Docker network",
        default="dcs_default",
    )
    docker_image: StringProperty(
        name="Docker image",
        default="3dcitydb/citydb-tool:latest",
    )
    extra_export_args: StringProperty(
        name="Extra export args",
        default="",
    )
    extra_import_args: StringProperty(
        name="Extra import args",
        default="",
    )
    import_textures: BoolProperty(
        name="Import textures",
        default=True,
    )
    export_textures: BoolProperty(
        name="Export textures",
        default=True,
    )
    last_message: StringProperty(
        name="Last result",
        default="",
        maxlen=2048,
    )


def _sync_from_prefs(settings: CityDBBridgeSettings, prefs: CityDBBridgePreferences) -> None:
    settings.working_dir = prefs.default_workdir
    settings.import_subdir = prefs.default_import_subdir
    settings.import_filename = prefs.default_import_filename
    settings.high_import_filename = prefs.default_high_import_filename
    settings.export_subdir = prefs.default_export_subdir
    settings.export_filename = prefs.default_export_filename
    settings.db_host = prefs.db_host
    settings.db_port = prefs.db_port
    settings.db_name = prefs.db_name
    settings.db_schema = prefs.db_schema
    settings.db_user = prefs.db_user
    settings.db_password = prefs.db_password
    settings.docker_network = prefs.docker_network
    settings.docker_image = prefs.docker_image
    settings.low_lods = prefs.low_lods
    settings.high_lods = prefs.high_lods
    settings.high_sql_template = prefs.high_sql_template
    settings.replace_on_high = prefs.replace_on_high
    settings.extra_export_args = prefs.extra_export_args
    settings.extra_import_args = prefs.extra_import_args


class CITYDB_OT_LoadDefaults(Operator):
    bl_idname = "citydb_bridge.load_defaults"
    bl_label = "Load defaults"
    bl_description = "Load addon defaults into this .blend"

    def execute(self, context):
        prefs = _addon_prefs()
        if prefs is None:
            self.report({"ERROR"}, "Addon preferences unavailable.")
            return {"CANCELLED"}
        settings = context.scene.citydb_bridge_settings
        _sync_from_prefs(settings, prefs)
        settings.last_message = "Settings loaded from addon defaults."
        self.report({"INFO"}, settings.last_message)
        return {"FINISHED"}


class CITYDB_OT_SaveDefaults(Operator):
    bl_idname = "citydb_bridge.save_defaults"
    bl_label = "Save as defaults"
    bl_description = "Copy current settings into addon defaults (save Blender prefs to persist)"

    def execute(self, context):
        prefs = _addon_prefs()
        if prefs is None:
            self.report({"ERROR"}, "Addon preferences unavailable.")
            return {"CANCELLED"}
        settings = context.scene.citydb_bridge_settings
        prefs.default_workdir = settings.working_dir
        prefs.default_import_subdir = settings.import_subdir
        prefs.default_import_filename = settings.import_filename
        prefs.default_high_import_filename = settings.high_import_filename
        prefs.default_export_subdir = settings.export_subdir
        prefs.default_export_filename = settings.export_filename
        prefs.db_host = settings.db_host
        prefs.db_port = settings.db_port
        prefs.db_name = settings.db_name
        prefs.db_schema = settings.db_schema
        prefs.db_user = settings.db_user
        prefs.db_password = settings.db_password
        prefs.docker_network = settings.docker_network
        prefs.docker_image = settings.docker_image
        prefs.low_lods = settings.low_lods
        prefs.high_lods = settings.high_lods
        prefs.high_sql_template = settings.high_sql_template
        prefs.replace_on_high = settings.replace_on_high
        prefs.extra_export_args = settings.extra_export_args
        prefs.extra_import_args = settings.extra_import_args
        settings.last_message = "Defaults updated. Save user preferences to keep them."
        self.report({"INFO"}, settings.last_message)
        return {"FINISHED"}


def _validate_settings(settings: CityDBBridgeSettings) -> str:
    missing = []
    if not settings.db_host:
        missing.append("DB host")
    if not settings.db_name:
        missing.append("DB name")
    if not settings.db_user:
        missing.append("DB user")
    if not settings.working_dir:
        missing.append("Workspace folder")
    return ", ".join(missing)


def _build_paths(settings: CityDBBridgeSettings):
    root = Path(settings.working_dir).expanduser().resolve()
    import_dir = root / settings.import_subdir
    high_import = root / settings.import_subdir
    export_dir = root / settings.export_subdir
    _ensure_dirs(import_dir)
    _ensure_dirs(export_dir)
    return {
        "root": root,
        "import_file": import_dir / settings.import_filename,
        "high_import_file": high_import / settings.high_import_filename,
        "export_file": export_dir / settings.export_filename,
    }


def _build_export_command(
    settings: CityDBBridgeSettings,
    output_container_path: str,
    lods: str | None,
    sql_filter: str | None,
) -> List[str]:
    cmd = [
        "docker",
        "run",
        "--rm",
        "-v",
        f"{_normalize_path_for_docker(Path(settings.working_dir).expanduser().resolve())}:/input",
    ]
    if settings.docker_network:
        cmd.extend(["--network", settings.docker_network])
    cmd.extend(
        [
            settings.docker_image,
            "export",
            "cityjson",
            "-H",
            settings.db_host,
        ]
    )
    if settings.db_port:
        cmd.extend(["-P", str(settings.db_port)])
    cmd.extend(["-d", settings.db_name])
    if settings.db_schema:
        cmd.extend(["-S", settings.db_schema])
    cmd.extend(
        [
            "-u",
            settings.db_user,
        ]
    )
    if settings.db_password:
        cmd.extend(["-p", settings.db_password])
    if lods:
        cmd.extend(["-l", lods])
    if sql_filter:
        cmd.extend(["--sql-filter", sql_filter])
    if settings.extra_export_args:
        cmd.extend(shlex.split(settings.extra_export_args))
    cmd.extend(["-o", output_container_path])
    return cmd


def _run_command(cmd: List[str], password: str) -> subprocess.CompletedProcess:
    display = _mask_password(cmd, password)
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=False)
    except FileNotFoundError as exc:
        raise RuntimeError(f"Docker not found. Command was: {display}") from exc

    if result.returncode != 0:
        stderr = result.stderr.strip()
        stdout = result.stdout.strip()
        msg = f"Command failed ({result.returncode}). Command: {display}"
        if stdout:
            msg += f"\nstdout: {stdout}"
        if stderr:
            msg += f"\nstderr: {stderr}"
        raise RuntimeError(msg)
    return result


class CITYDB_OT_FetchFromDB(Operator):
    bl_idname = "citydb_bridge.fetch"
    bl_label = "Fetch from CityDB"
    bl_description = "Export CityJSON from CityDB with docker and load it with CityJSONEditor"

    def execute(self, context):
        settings = context.scene.citydb_bridge_settings
        missing = _validate_settings(settings)
        if missing:
            self.report({"ERROR"}, f"Missing required settings: {missing}")
            return {"CANCELLED"}
        if not _require_cityjson_editor():
            self.report({"ERROR"}, "CityJSONEditor add-on must be enabled.")
            return {"CANCELLED"}

        paths = _build_paths(settings)
        target_in_container = f"/input/{settings.import_subdir}/{settings.import_filename}"

        lods = settings.low_lods.strip() or None
        cmd = _build_export_command(settings, target_in_container, lods=lods, sql_filter=None)

        try:
            _run_command(cmd, settings.db_password)
        except RuntimeError as exc:
            settings.last_message = str(exc)
            self.report({"ERROR"}, settings.last_message)
            return {"CANCELLED"}

        local_file = paths["import_file"]
        if not local_file.exists():
            settings.last_message = f"Export command finished, but file not found: {local_file}"
            self.report({"ERROR"}, settings.last_message)
            return {"CANCELLED"}

        ok, msg = _validate_cityjson(local_file)
        if not ok:
            settings.last_message = f"CityJSON file check failed: {msg}"
            self.report({"ERROR"}, settings.last_message)
            return {"CANCELLED"}

        op_result = bpy.ops.cityjson.import_file(
            filepath=str(local_file),
            texture_setting=settings.import_textures,
        )
        if "FINISHED" not in op_result:
            settings.last_message = f"CityJSONEditor import returned: {op_result}"
            self.report({"ERROR"}, settings.last_message)
            return {"CANCELLED"}

        settings.last_message = f"Loaded {local_file}"
        self.report({"INFO"}, settings.last_message)
        return {"FINISHED"}


class CITYDB_OT_FetchHighForSelection(Operator):
    bl_idname = "citydb_bridge.fetch_high"
    bl_label = "Load high LoD for selection"
    bl_description = "Fetch higher LoD geometry for the selected building and load it"

    def execute(self, context):
        settings = context.scene.citydb_bridge_settings
        missing = _validate_settings(settings)
        if missing:
            self.report({"ERROR"}, f"Missing required settings: {missing}")
            return {"CANCELLED"}
        if not _require_cityjson_editor():
            self.report({"ERROR"}, "CityJSONEditor add-on must be enabled.")
            return {"CANCELLED"}
        if not context.selected_objects:
            self.report({"ERROR"}, "Select a building object with a gmlid property.")
            return {"CANCELLED"}

        gmlid = context.selected_objects[0].get("gmlid")
        if not gmlid:
            self.report({"ERROR"}, "Selected object is missing a gmlid property.")
            return {"CANCELLED"}

        paths = _build_paths(settings)
        target_in_container = f"/input/{settings.import_subdir}/{settings.high_import_filename}"
        sql_filter = settings.high_sql_template.replace("{gmlid}", str(gmlid))

        lods = settings.high_lods.strip() or None
        cmd = _build_export_command(settings, target_in_container, lods=lods, sql_filter=sql_filter)

        try:
            _run_command(cmd, settings.db_password)
        except RuntimeError as exc:
            settings.last_message = str(exc)
            self.report({"ERROR"}, settings.last_message)
            return {"CANCELLED"}

        local_file = paths["high_import_file"]
        if not local_file.exists():
            settings.last_message = f"High-LoD export finished, but file not found: {local_file}"
            self.report({"ERROR"}, settings.last_message)
            return {"CANCELLED"}

        ok, msg = _validate_cityjson(local_file)
        if not ok:
            settings.last_message = f"CityJSON file check failed: {msg}"
            self.report({"ERROR"}, settings.last_message)
            return {"CANCELLED"}

        if settings.replace_on_high:
            for obj in list(context.selected_objects):
                bpy.data.objects.remove(obj, do_unlink=True)

        op_result = bpy.ops.cityjson.import_file(
            filepath=str(local_file),
            texture_setting=settings.import_textures,
        )
        if "FINISHED" not in op_result:
            settings.last_message = f"CityJSONEditor import returned: {op_result}"
            self.report({"ERROR"}, settings.last_message)
            return {"CANCELLED"}

        settings.last_message = f"Loaded high-LoD for gmlid '{gmlid}' from {local_file}"
        self.report({"INFO"}, settings.last_message)
        return {"FINISHED"}


class CITYDB_OT_ExportToDB(Operator):
    bl_idname = "citydb_bridge.export"
    bl_label = "Export + Push"
    bl_description = "Export CityJSON with CityJSONEditor and import it into CityDB via docker"

    def execute(self, context):
        settings = context.scene.citydb_bridge_settings
        missing = _validate_settings(settings)
        if missing:
            self.report({"ERROR"}, f"Missing required settings: {missing}")
            return {"CANCELLED"}
        if not _require_cityjson_editor():
            self.report({"ERROR"}, "CityJSONEditor add-on must be enabled.")
            return {"CANCELLED"}

        paths = _build_paths(settings)
        mount = f"{_normalize_path_for_docker(paths['root'])}:/input"
        source_in_container = f"/input/{settings.export_subdir}/{settings.export_filename}"

        export_result = bpy.ops.cityjson.export_file(
            filepath=str(paths["export_file"]),
            check_existing=False,
            texture_setting=settings.export_textures,
        )
        if "FINISHED" not in export_result:
            settings.last_message = f"CityJSONEditor export returned: {export_result}"
            self.report({"ERROR"}, settings.last_message)
            return {"CANCELLED"}

        cmd = [
            "docker",
            "run",
            "--rm",
            "-v",
            mount,
        ]
        if settings.docker_network:
            cmd.extend(["--network", settings.docker_network])
        cmd.extend(
            [
                settings.docker_image,
                "import",
                "cityjson",
                "-H",
                settings.db_host,
            ]
        )
        if settings.db_port:
            cmd.extend(["-P", str(settings.db_port)])
        cmd.extend(["-d", settings.db_name])
        if settings.db_schema:
            cmd.extend(["-S", settings.db_schema])
        cmd.extend(
            [
                "-u",
                settings.db_user,
            ]
        )
        if settings.db_password:
            cmd.extend(["-p", settings.db_password])
        if settings.extra_import_args:
            cmd.extend(shlex.split(settings.extra_import_args))
        cmd.append(source_in_container)

        try:
            _run_command(cmd, settings.db_password)
        except RuntimeError as exc:
            settings.last_message = str(exc)
            self.report({"ERROR"}, settings.last_message)
            return {"CANCELLED"}

        settings.last_message = f"Pushed {paths['export_file']} into CityDB."
        self.report({"INFO"}, settings.last_message)
        return {"FINISHED"}


class CITYDB_PT_BridgePanel(Panel):
    bl_label = "CityDB Bridge"
    bl_idname = "CITYDB_PT_bridge"
    bl_space_type = "VIEW_3D"
    bl_region_type = "UI"
    bl_category = "CityDB"

    def draw(self, context):
        layout = self.layout
        settings = context.scene.citydb_bridge_settings

        box = layout.box()
        box.label(text="Workspace")
        box.prop(settings, "working_dir")
        box.prop(settings, "import_subdir")
        box.prop(settings, "import_filename")
        box.prop(settings, "high_import_filename")
        box.prop(settings, "export_subdir")
        box.prop(settings, "export_filename")

        box = layout.box()
        box.label(text="Database / docker")
        box.prop(settings, "db_host")
        box.prop(settings, "db_port")
        box.prop(settings, "db_name")
        box.prop(settings, "db_schema")
        box.prop(settings, "db_user")
        box.prop(settings, "db_password")
        box.prop(settings, "docker_network")
        box.prop(settings, "docker_image")
        box.prop(settings, "extra_export_args")
        box.prop(settings, "extra_import_args")

        box = layout.box()
        box.label(text="LoD controls")
        box.prop(settings, "low_lods")
        box.prop(settings, "high_lods")
        box.prop(settings, "high_sql_template")
        box.prop(settings, "replace_on_high")

        row = layout.row(align=True)
        row.operator(CITYDB_OT_LoadDefaults.bl_idname, icon="FILE_REFRESH")
        row.operator(CITYDB_OT_SaveDefaults.bl_idname, icon="FOLDER_REDIRECT")
        layout.operator("preferences.addon_show", text="Open addon preferences").module = __name__

        box = layout.box()
        box.label(text="CityJSON options")
        box.prop(settings, "import_textures")
        box.prop(settings, "export_textures")
        op_row = box.row(align=True)
        op_row.operator(CITYDB_OT_FetchFromDB.bl_idname, icon="IMPORT")
        op_row.operator(CITYDB_OT_FetchHighForSelection.bl_idname, icon="ZOOM_IN")
        op_row.operator(CITYDB_OT_ExportToDB.bl_idname, icon="EXPORT")

        help_box = layout.box()
        help_box.label(text="Guide")
        for line in HELP_TEXT:
            help_box.label(text=line)

        if settings.last_message:
            layout.separator()
            layout.label(text="Last result:")
            layout.label(text=settings.last_message)


classes = (
    CityDBBridgePreferences,
    CityDBBridgeSettings,
    CITYDB_OT_LoadDefaults,
    CITYDB_OT_SaveDefaults,
    CITYDB_OT_FetchFromDB,
    CITYDB_OT_FetchHighForSelection,
    CITYDB_OT_ExportToDB,
    CITYDB_PT_BridgePanel,
)


def _maybe_sync_defaults():
    prefs = _addon_prefs()
    try:
        scene = getattr(bpy.context, "scene", None)
    except Exception:
        scene = None
    if prefs and scene and hasattr(scene, "citydb_bridge_settings"):
        _sync_from_prefs(scene.citydb_bridge_settings, prefs)


def register():
    for cls in classes:
        bpy.utils.register_class(cls)
    bpy.types.Scene.citydb_bridge_settings = PointerProperty(type=CityDBBridgeSettings)
    _maybe_sync_defaults()


def unregister():
    for cls in reversed(classes):
        bpy.utils.unregister_class(cls)
    if hasattr(bpy.types, "Scene") and hasattr(bpy.types.Scene, "citydb_bridge_settings"):
        del bpy.types.Scene.citydb_bridge_settings


if __name__ == "__main__":
    register()
