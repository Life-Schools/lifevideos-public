#!/bin/sh

# Wait for Postgres to be ready
until pg_isready -h db -U "$POSTGRES_USER"; do
  echo "Waiting for Postgres..."
  sleep 1
done

# Run psql command to create the materialized view
PGPASSWORD="$POSTGRES_PASSWORD" psql -h db -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /docker-entrypoint-initdb.d/create_materialized_view.sql
