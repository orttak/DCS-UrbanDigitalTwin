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

Blender can connect to the same database to visualize and edit 3D models.

1.  **Connection Details**:
    - **Host**: `localhost`
    - **Port**: `5432`
    - **Database**: `citydb` (or as configured)
    - **User/Pass**: `postgres` / `postgres`

2.  **Workflow**:
    - Use the [3DCityDB Blender-Importer-Exporter](https://github.com/3dcitydb/3dcitydb-blender-exporter) (if available/compatible) or [Up3date](https://github.com/cityjson/Up3date) for CityJSON.
    - Alternatively, export CityGML/CityJSON from the DB and import into Blender using the [CityJSON Add-on](https://github.com/cityjson/cityjson-blender-addon).

## Architecture

- **`citydb` Service**: PostgreSQL + PostGIS + 3DCityDB scripts.
- **`/web`**: Next.js App Router application.
- **`citydb_data` Volume**: Persists all database data.

## Future Work

- Add 3D viewer (Three.js / Deck.gl) to the web app.
- Integrate WFS / WMS services.
- Implement AI-based enrichment pipelines.
