#!/usr/bin/env bash

. lib.sh

# https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-get-user.html
execute_get_request _security/user
