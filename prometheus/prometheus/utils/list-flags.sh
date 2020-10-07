#!/usr/bin/env bash

. lib.sh

# https://prometheus.io/docs/prometheus/latest/querying/api/#flags
execute_get_request status/flags
