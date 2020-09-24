#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

mysql --host=localhost --port=3306 --user=$HEALTHCHECK_USERNAME --password=$HEALTHCHECK_PASSWORD \
  --execute="SELECT version();" \
  2>&1 > /dev/null
