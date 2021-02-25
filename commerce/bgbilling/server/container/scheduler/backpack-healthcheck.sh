#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly WAIT_TIMEOUT=2

echo status \
  | nc -w $WAIT_TIMEOUT localhost 9066 \
  | grep Uptime \
  > /dev/null
curl --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://jolokia_iev5iChainet:We0baena2kae@localhost:8778/jolokia/ \
  > /dev/null
