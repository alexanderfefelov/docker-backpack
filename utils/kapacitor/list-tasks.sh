#!/usr/bin/env bash

# https://docs.influxdata.com/kapacitor/v1.5/working/api/#listing-tasks
http --verbose GET http://kapacitor.backpack.test:9092/kapacitor/v1/tasks
