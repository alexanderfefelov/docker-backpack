#!/usr/bin/env bash

. lib.sh

for i in {1..7}; do
  message=$(lorem -s 1)
  echo $message
  execute_post_form_request message destination==queue://lorem.ipsum body=="$message"
done
