#!/usr/bin/env bash

readonly DEVICE_NO=${1:-3}

. lib.sh

readonly REQUEST='{
  "Command": "PaymentCash",
  "IdCommand": "'$(uuidgen)'",
  "NumDevice": '$DEVICE_NO',
  "Amount": 2718281.82
}'

execute_post_request <<< "$REQUEST"
