#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly WAIT_TIMEOUT=2

echo status \
  | nc -w $WAIT_TIMEOUT -u localhost 2005 \
  | grep Uptime \
  > /dev/null
curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://localhost:8080/billing/executer \
  > /dev/null
curl --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://jolokia_jei4cie5Kahg:eaFai4eTh1re@localhost:8778/jolokia/ \
  > /dev/null
