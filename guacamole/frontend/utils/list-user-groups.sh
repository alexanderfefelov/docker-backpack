#!/usr/bin/env bash

. lib.sh

token=$(create_token $USERNAME $PASSWORD)
for id in $(get_user_groups $token | jq --raw-output keys[]); do
  echo User group $id
  get_user_group_details $token $id
  get_user_group_permissions $token $id
  get_user_group_members $token $id
done
delete_token $token
