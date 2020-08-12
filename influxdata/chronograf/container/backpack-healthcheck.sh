#!/usr/bin/env bash

curl --head --fail --silent --user-agent healthcheck http://localhost:8888/ > /dev/null \
