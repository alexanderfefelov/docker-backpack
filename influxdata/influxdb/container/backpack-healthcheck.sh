#!/usr/bin/env bash

curl --head --fail --silent --user-agent healthcheck http://localhost:8086/ping > /dev/null \
