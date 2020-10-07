#!/usr/bin/env bash

. lib.sh

# https://prometheus.io/docs/prometheus/latest/querying/api/#tsdb-stats
execute_get_request status/tsdb
