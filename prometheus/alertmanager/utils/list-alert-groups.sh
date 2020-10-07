#!/usr/bin/env bash

. lib.sh

# https://github.com/prometheus/alertmanager/blob/master/api/v2/openapi.yaml
execute_get_request alerts/groups
