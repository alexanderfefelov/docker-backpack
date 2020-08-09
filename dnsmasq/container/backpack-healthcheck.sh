#!/usr/bin/env bash

nc -z -u -w 2 localhost 53 \
&& curl --head --fail --silent --user-agent healthcheck --user admin_inestorasyno:impardalwina http://localhost:8080/ > /dev/null
