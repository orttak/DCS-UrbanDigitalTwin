# Database Configuration Notes

This directory contains helper notes for the 3DCityDB instance.

## Environment Variables

The `3dcitydb/3dcitydb-pg` image requires the following environment variables to initialize the database:

- `POSTGRES_PASSWORD`: Password for the database user.
- `POSTGRES_DB`: Name of the database to create.
- `POSTGRES_USER`: Database user name.
- `SRID`: The Spatial Reference System Identifier (e.g., 25832 for EPSG:25832).

These are defined in the root `.env` file (copied from `.env.example`).

## Schema

The database schema is automatically initialized by the Docker image on the first run. No manual SQL execution is required for the basic setup.

## Persistence

Data is stored in the `citydb_data` Docker volume. This ensures that imported city data persists even if the container is stopped or removed (unless the volume is explicitly removed).
