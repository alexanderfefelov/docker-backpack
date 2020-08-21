#!/bin/sh

set -e

readonly WAIT_TIMEOUT=2

nc -z -w $WAIT_TIMEOUT -u localhost 53
curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" --user admin_inestorasyno:impardalwina http://localhost:8080/ > /dev/null
