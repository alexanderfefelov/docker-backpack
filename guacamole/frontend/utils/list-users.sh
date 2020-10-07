#!/usr/bin/env bash

. lib.sh

token=$(authenticate $USERNAME $PASSWORD)
for id in $(get_users $token | jq --raw-output .[].username); do
  echo User $id
  get_user_details $token $id
  get_user_groups $token $id
  get_user_permissions $token $id
  get_user_effective_permissions $token $id
done
deauthenticate $token
