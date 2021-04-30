#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly WAIT_TIMEOUT=2

nc -z localhost 2003
nc -z -u localhost 2003
nc -z localhost 2004
nc -z localhost 2023
nc -z localhost 2024
nc -z -u localhost 8125
nc -z localhost 8126
curl --request GET --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://localhost:80/tags \
  > /dev/null
curl --request GET --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://localhost:8080/tags \
  > /dev/null
