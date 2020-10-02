#!/usr/bin/env bash

. lib.sh

token=$(create_token $USERNAME $PASSWORD)
for id in $(get_users $token | jq --raw-output .[].username); do
  echo User $id
  get_user_details $token $id
done
delete_token $token
