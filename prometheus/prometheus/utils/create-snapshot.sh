#!/usr/bin/env bash

. lib.sh

# https://prometheus.io/docs/prometheus/latest/querying/api/#snapshot
execute_post_request admin/tsdb/snapshot
