#!/usr/bin/env bash

. lib.sh

readonly REQUEST='{
  "Command": "List"
}'

execute_post_request <<< "$REQUEST"
