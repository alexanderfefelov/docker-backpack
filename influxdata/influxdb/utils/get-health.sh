#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# https://docs.influxdata.com/influxdb/v1.8/tools/api/#health-http-endpoint
http --verbose GET http://influxdb.backpack.test:8086/health
