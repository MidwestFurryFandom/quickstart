#!/bin/bash
set -e

/app/env/bin/python3 /app/sideboard/sep.py alembic upgrade heads

exec "$@"