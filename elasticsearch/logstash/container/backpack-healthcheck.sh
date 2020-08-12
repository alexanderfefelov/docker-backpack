#!/usr/bin/env bash

curl --head --fail --silent --user-agent healthcheck http://localhost:9600/ > /dev/null
