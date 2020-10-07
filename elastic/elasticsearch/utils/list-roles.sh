#!/usr/bin/env bash

. lib.sh

# https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-get-role.html
execute_get_request _security/role
