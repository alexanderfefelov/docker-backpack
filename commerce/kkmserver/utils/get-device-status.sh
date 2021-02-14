#!/usr/bin/env bash

readonly DEVICE_NO=${1:-3}

. lib.sh

readonly REQUEST='{
  "Command": "GetDataKKT",
  "IdCommand": "'$(uuidgen)'",
  "NumDevice": '$DEVICE_NO'
}'

execute_post_request <<< "$REQUEST"
