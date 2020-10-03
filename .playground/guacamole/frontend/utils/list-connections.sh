#!/usr/bin/env bash

. lib.sh

token=$(create_token $USERNAME $PASSWORD)
for id in $(get_connections $token | jq --raw-output .[].identifier); do
  echo Connection $id
  get_connection_details $token $id
  get_connection_parameters $token $id
done
delete_token $token
