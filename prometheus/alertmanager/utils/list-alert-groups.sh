#!/usr/bin/env bash

# https://github.com/prometheus/alertmanager/blob/master/api/v2/openapi.yaml
http --verbose GET http://alertmanager.backpack.test:9093/api/v2/alerts/groups
