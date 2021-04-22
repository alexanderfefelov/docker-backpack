#!/usr/bin/env bash

readonly WAIT_TIMEOUT=2

curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://localhost:8080/jasperserver \
  > /dev/null
curl --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://jolokia_ahkahshoog5u:niedohque9yu@localhost:8778/jolokia/ \
  > /dev/null
