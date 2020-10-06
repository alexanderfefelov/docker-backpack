#!/usr/bin/env bash

PGPASSWORD=undestrokend psql --host=main.postgresql.backpack.test --port=5432 --username=postgres_ibleabaldine "$@"
