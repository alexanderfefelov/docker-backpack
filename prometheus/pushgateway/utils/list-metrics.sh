#!/usr/bin/env bash

# https://github.com/prometheus/pushgateway/blob/master/README.md#query-api
http --verbose GET http://pushgateway.backpack.test:9091/api/v1/metrics
