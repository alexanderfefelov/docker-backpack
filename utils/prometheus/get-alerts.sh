#!/usr/bin/env bash

# https://prometheus.io/docs/prometheus/latest/querying/api/#alerts
http --verbose GET http://prometheus.backpack.test:9090/api/v1/alerts
