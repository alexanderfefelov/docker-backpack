#!/bin/sh

# https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING
readonly CONNECTION_STRING=postgresql://$HEALTHCHECK_USERNAME:$HEALTHCHECK_PASSWORD@localhost:5432/postgres

psql $CONNECTION_STRING --command="SELECT version();" 2>&1 > /dev/null
