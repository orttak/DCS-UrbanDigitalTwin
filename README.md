# 3D City Playground

A minimal 3D city "playground" using [3DCityDB](https://www.3dcitydb.org/), Docker, and Next.js. This project demonstrates a simple architecture for managing and visualizing 3D city data.

## Prerequisites

- **Docker & Docker Compose**: [Install Docker Desktop](https://www.docker.com/products/docker-desktop/)
- **Node.js**: [Install Node.js](https://nodejs.org/) (v18+ recommended)
- **Blender**: [Download Blender](https://www.blender.org/download/) (for 3D visualization)

## Getting Started

### 1. Database Setup (Docker)

The database runs in a Docker container using the official `3dcitydb/3dcitydb-pg` image.

1.  **Configure Environment Variables**:
    Copy `.env.example` to a new file named `.env` in the root directory:
    ```bash
    cp .env.example .env
    ```
    You can usually keep the default values for a local playground.

2.  **Start the Database**:
    Run the following command to start the 3DCityDB instance:
    ```bash
    docker compose up -d citydb
    ```
    *   This starts an empty 3DCityDB instance.
    *   The schema is automatically initialized.
    *   Data is persisted in the `citydb_data` Docker volume.

### 2. Populating the Database

This repo does not contain city data. You need to import it manually.

1.  **Download Data**:
    - [Awesome CityGML](https://github.com/Otep/awesome-citygml) has many datasets.
    - Recommended: A small subset of [Hamburg LoD2](https://suche.transparenz.hamburg.de/dataset/3d-stadtmodell-hamburg-lod-2-de) or similar.

2.  **Import Data**:
    You can use the [3DCityDB Importer/Exporter](https://github.com/3dcitydb/importer-exporter) tool or the `citydb-tool` Docker image.

    **Example using `citydb-tool` (Docker):**
    1.  You have your data at `D:\Docker\data\6431\6431.gml`.
    2.  Run this command from `D:\Docker`:
    ```bash
    docker run --rm -v ${PWD}/data:/input --network docker_default 3dcitydb/citydb-tool:latest import citygml -H citydb -d citydb -u postgres -p postgres /input/6431/6431.gml
    ```
    *(Note: We use `--network docker_default` so the tool can talk to the database container `citydb`.)*

    **Persistence**:
    Once imported, data is stored in the `citydb_data` volume. This is a **Docker-managed volume**, not a folder in your project files. It persists until you explicitly remove it.

### 3. Running the Web App

The Next.js app connects to the database to list buildings.

1.  **Navigate to `/web`**:
    ```bash
    cd web
    ```

2.  **Install Dependencies**:
    ```bash
    npm install
    ```

3.  **Configure Connection**:
    Copy `.env.example` (from root) content or ensure `web/.env.local` exists with correct `DB_*` variables.
    *(A default `.env.local` should have been created for you).*

4.  **Run Development Server**:
    ```bash
    npm run dev
    ```

5.  **Visit**: Open [http://localhost:3000](http://localhost:3000).
    - If the DB is empty, it will say "No buildings found".
    - After import, you should see a list of buildings.

## Using Blender

Blender does not natively support 3DCityDB. The best workflow is to export data to **CityJSON**, which Blender can read with a free add-on.

### 1. Install Blender Add-on
1.  Download the **[CityJSON Blender Add-on](https://github.com/cityjson/cityjson-blender-addon)** (Code > Download ZIP).
2.  In Blender: `Edit > Preferences > Add-ons > Install...` (select the ZIP).
3.  Enable the add-on ("Import-Export: CityJSON").

### 2. Export Data from DB to CityJSON
Run this command to export your city data to a file named `my_city.json` in your `data` folder:

```bash
docker run --rm -v ${PWD}/data:/input --network docker_default 3dcitydb/citydb-tool:latest export cityjson \
  -H citydb -d citydb -u postgres -p postgres \
  --cityjson-version 2.0 --no-json-lines \
  -o /input/my_city.json
```

### 3. Import into Blender
1.  In Blender: `File > Import > CityJSON (.json)`.
2.  Select `D:\Docker\data\my_city.json`.
3.  You will see your 3D buildings!

### 4. The "Edit Cycle" (How to Save)
Blender saves changes to the **file**, not the database. To update the database, you must re-import.

1.  **Edit in Blender**: Move buildings, change heights, etc.
2.  **Export from Blender**: `File > Export > CityJSON`. Overwrite `my_city.json` (or create a new file).
3.  **Update Database**: Run the **Import** command again with your modified file.
    *   *Note*: The database will update the existing buildings if the IDs match.

**The Flow:**
`Database` --(export cmd)--> `CityJSON File` --(import)--> `Blender`
                                      |
                                   (Edit)
                                      |
`Database` <--(import cmd)-- `CityJSON File` <--(export)-- `Blender`

## Troubleshooting

### Import Fails (0 Features)
If the import command runs but imports 0 features, it's likely a networking issue where the tool cannot reach the database.
**Solution**: Use the `--network docker_default` flag in your `docker run` command (as shown in the Import section above).

### "System cannot find the file specified"
This error from Docker usually means the Docker Desktop daemon is not running.
**Solution**: Open Docker Desktop and wait for the engine to start.

## Quick Reference

**Import Data (CityGML):**
```bash
docker run --rm -v ${PWD}/data:/input --network docker_default 3dcitydb/citydb-tool:latest import citygml -H citydb -d citydb -u postgres -p postgres /input/6431/6431.gml
```

**Export Data (CityJSON for Blender):**
```bash
docker run --rm -v ${PWD}/data:/input --network docker_default 3dcitydb/citydb-tool:latest export cityjson \
  -H citydb -d citydb -u postgres -p postgres \
  --cityjson-version 2.0 --no-json-lines \
  -o /input/my_city.json
```

## Architecture

- **`citydb` Service**: PostgreSQL + PostGIS + 3DCityDB scripts.
- **`/web`**: Next.js App Router application.
- **`citydb_data` Volume**: Persists all database data.

## Future Work

- Add 3D viewer (Three.js / Deck.gl) to the web app.
- Integrate WFS / WMS services.
- Implement AI-based enrichment pipelines.
