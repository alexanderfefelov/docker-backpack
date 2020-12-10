#!/usr/bin/env bash

readonly DEVICE_NO=${1:-3}

. lib.sh

readonly REQUEST='{
  "Command": "DepositingCash",
  "IdCommand": "'$(uuidgen)'",
  "NumDevice": '$DEVICE_NO',
  "Amount": 3141592.65
}'

execute_post_request <<< "$REQUEST"
