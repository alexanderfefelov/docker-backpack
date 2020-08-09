#!/usr/bin/env bash

curl --head --fail --silent --user-agent healthcheck http://localhost:5601/ > /dev/null
