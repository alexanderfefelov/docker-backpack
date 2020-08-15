#!/usr/bin/env bash

curl --head --fail --silent --user-agent backpack-healthcheck http://localhost:9200/ > /dev/null \
&& curl --head --fail --silent --user-agent backpack-healthcheck http://localhost:9300/ > /dev/null
