#!/usr/bin/env bash

readonly COLLECTION_NAME=${1:-lorem-ipsum}

. lib.sh

readonly JSON='{
  "name": "'$COLLECTION_NAME'",
  "fields": [
    {"name": "text", "type": "string"},
    {"name": "order", "type": "int32" }
  ],
  "default_sorting_field": "order"
}'

execute_post_request collections <<< "$JSON"
