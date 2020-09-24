#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING
readonly CONNECTION_STRING=postgresql://$HEALTHCHECK_USERNAME:$HEALTHCHECK_PASSWORD@localhost:5432/postgres

psql $CONNECTION_STRING \
  --command="SELECT version();" \
  2>&1 > /dev/null
