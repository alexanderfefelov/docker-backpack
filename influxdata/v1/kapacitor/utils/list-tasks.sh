#!/usr/bin/env bash

. lib.sh

# https://docs.influxdata.com/kapacitor/v1.5/working/api/#listing-tasks
execute_get_request tasks
