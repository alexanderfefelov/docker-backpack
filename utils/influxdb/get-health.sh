#!/usr/bin/env bash

# https://docs.influxdata.com/influxdb/v1.8/tools/api/#health-http-endpoint
http GET http://influxdb.backpack.test:8086/health
