#!/usr/bin/env bash

. lib.sh

token=$(create_token)
for id in $(get_users $token | jq --raw-output .[].username); do
  echo User $id
  get_user_details $token $id
done
delete_token $token
