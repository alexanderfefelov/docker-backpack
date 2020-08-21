#!/usr/bin/env bash

set -e

readonly WAIT_TIMEOUT=2

curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" http://localhost:9200/ > /dev/null
curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" http://localhost:9300/ > /dev/null
