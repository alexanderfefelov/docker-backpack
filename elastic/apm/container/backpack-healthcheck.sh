#!/usr/bin/env bash

readonly WAIT_TIMEOUT=2

curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" http://localhost:8200/ > /dev/null
