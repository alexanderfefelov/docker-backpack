#!/usr/bin/env bash

. lib.sh

readonly DESTINATION=queue://lorem.ipsum

for i in {1..7}; do
  message="$i: $(lorem -p 3)"
  echo $message
  execute_post_form_request message destination==$DESTINATION body=="$message"
done
