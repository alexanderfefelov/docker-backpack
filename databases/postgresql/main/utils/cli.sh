#!/usr/bin/env bash

PGPASSWORD=undestrokend psql --host=postgresql-main.backpack.test --port=5432 --username=postgres_ibleabaldine "$@"
