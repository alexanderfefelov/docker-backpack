#!/usr/bin/env bash

. lib.sh

readonly REQUEST='{
  "Command": "GetServerData",
  "IdCommand": "'$(uuidgen)'"
}'

execute_post_request <<< "$REQUEST"
