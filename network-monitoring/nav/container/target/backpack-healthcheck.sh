#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly WAIT_TIMEOUT=2

[ $(supervisorctl status | grep --count --invert-match RUNNING) = 0 ]
nc -z -w $WAIT_TIMEOUT -u localhost 162
curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://localhost:80/ \
  > /dev/null
