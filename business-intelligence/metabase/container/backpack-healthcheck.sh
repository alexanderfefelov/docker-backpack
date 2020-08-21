#!/bin/sh

readonly WAIT_TIMEOUT=2

curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent backpack-healthcheck http://localhost:3000/ > /dev/null
