#!/usr/bin/env bash

curl --head --fail --silent --user-agent backpack-healthcheck http://localhost:5601/ > /dev/null
