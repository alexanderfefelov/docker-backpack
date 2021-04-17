#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

/opt/mssql-tools/bin/sqlcmd -U healthcheck_sainarao9cha -P p^Zoot6hiehoo9 -Q "SELECT @@version;" \
  2>&1 > /dev/null
