#!/usr/bin/env bash

readonly COLLECTION_NAME=${1:-lorem-ipsum}

. lib.sh

for i in {1..42}; do
  text=$(lorem -p 3 | tr '\n' ' ')
  echo $i

  json='{
    "text": "'$text'",
    "order": '$i'
  }'

  execute_post_request collections/$COLLECTION_NAME/documents <<< "$json"
done
