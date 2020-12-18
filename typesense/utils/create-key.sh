#!/usr/bin/env bash

readonly COLLECTION_NAME=${1:-lorem-ipsum}

. lib.sh

readonly JSON='{
  "description": "God mode",
  "actions": ["*"],
  "collections": ["*"]
}'

execute_post_request keys <<< "$JSON"
