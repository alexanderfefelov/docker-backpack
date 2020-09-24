#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly WAIT_TIMEOUT=2

curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://healthcheck_sheetheekahx:yoongootecie@localhost:9200/ \
  > /dev/null
curl --head --fail --silent --max-time $WAIT_TIMEOUT --user-agent "$(basename "$0")" \
  http://healthcheck_sheetheekahx:yoongootecie@localhost:9300/ \
  > /dev/null
