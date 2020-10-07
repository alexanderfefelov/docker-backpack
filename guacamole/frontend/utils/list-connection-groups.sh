#!/usr/bin/env bash

. lib.sh

token=$(authenticate $USERNAME $PASSWORD)
for id in $(get_connection_groups $token | jq --raw-output .[].identifier); do
  echo Connection group $id
  get_connection_group_details $token $id
  get_connection_group_tree $token $id
done
deauthenticate $token
