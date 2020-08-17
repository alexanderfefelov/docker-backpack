#!/usr/bin/env bash

readonly WAIT_TIMEOUT=2

curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent backpack-healthcheck http://localhost:5601/ > /dev/null
