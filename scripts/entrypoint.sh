#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

postgres_ready() {
    python <<END
import sys
import os
import psycopg2
try:
    conn = psycopg2.connect(
        dbname=os.environ["DB_NAME"],
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASSWORD"],
        host=os.environ["DB_HOST"],
        port=int(os.environ["DB_PORT"]),
    )
    conn.close()
except psycopg2.OperationalError as e:
    print(f"Postgres connection error: {e}")
    sys.exit(-1)
sys.exit(0)
END
}

until postgres_ready; do
    echo "Waiting for PostgreSQL (${DB_HOST}:${DB_PORT}) to become available..."
    sleep 3
done

echo >&2 "PostgreSQL is available!"

exec "$@"