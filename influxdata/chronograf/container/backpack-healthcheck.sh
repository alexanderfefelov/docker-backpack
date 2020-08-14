#!/usr/bin/env bash

curl --head --fail --silent --user-agent backpack-healthcheck http://localhost:8888/ > /dev/null
