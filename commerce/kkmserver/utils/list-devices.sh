#!/usr/bin/env bash

. lib.sh

readonly REQUEST='{
  "Command": "List",
  "IdCommand": "'$(uuidgen)'"
}'

execute_post_request <<< "$REQUEST"
