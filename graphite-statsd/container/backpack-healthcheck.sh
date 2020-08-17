#!/bin/sh

set -e

readonly WAIT_TIMEOUT=2

nc -z -w $WAIT_TIMEOUT localhost 2003
nc -z -w $WAIT_TIMEOUT localhost 2004
nc -z -w $WAIT_TIMEOUT localhost 2023
nc -z -w $WAIT_TIMEOUT localhost 2024
# TODO Health check exceeded timeout (2s) nc -z -w $WAIT_TIMEOUT -u localhost 8125
nc -z -w $WAIT_TIMEOUT localhost 8126
curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent backpack-healthcheck http://localhost:80/ > /dev/null
curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent backpack-healthcheck http://localhost:8080/ > /dev/null
