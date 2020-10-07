#!/usr/bin/env bash

. lib.sh

# https://prometheus.io/docs/prometheus/latest/querying/api/#runtime-information
execute_get_request status/runtimeinfo
