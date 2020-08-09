#!/bin/sh

curl --head --fail --silent --user-agent healthcheck http://localhost:9200/ > /dev/null \
&& curl --head --fail --silent --user-agent healthcheck http://localhost:9300/ > /dev/null
