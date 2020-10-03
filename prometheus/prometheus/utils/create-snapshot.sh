#!/usr/bin/env bash

# https://prometheus.io/docs/prometheus/latest/querying/api/#snapshot
http --verbose POST http://prometheus.backpack.test:9090/api/v1/admin/tsdb/snapshot
