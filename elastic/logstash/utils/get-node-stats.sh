#!/usr/bin/env bash

. lib.sh

# https://www.elastic.co/guide/en/logstash/current/node-stats-api.html
execute_get_request _node/stats
