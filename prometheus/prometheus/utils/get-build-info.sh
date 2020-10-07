#!/usr/bin/env bash

. lib.sh

# https://prometheus.io/docs/prometheus/latest/querying/api/#build-information
execute_get_request status/buildinfo
