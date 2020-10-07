#!/usr/bin/env bash

. lib.sh

# https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-health.html
execute_get_request _cluster/health
