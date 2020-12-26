#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly WAIT_TIMEOUT=2

nc -z -w $WAIT_TIMEOUT localhost 25565
nc -z -w $WAIT_TIMEOUT localhost 25575
curl --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://jolokia_dahhegeedahg:ahyaquaexiew@localhost:8778/jolokia/ \
  > /dev/null
