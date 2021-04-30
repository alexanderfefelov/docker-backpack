#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly WAIT_TIMEOUT=2

nc -z localhost 22
curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://localhost:3001/ \
  > /dev/null
