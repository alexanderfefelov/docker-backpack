#!/usr/bin/env bash

curl --head --fail --silent --user-agent backpack-healthcheck http://localhost:9092/kapacitor/v1/ping > /dev/null \
