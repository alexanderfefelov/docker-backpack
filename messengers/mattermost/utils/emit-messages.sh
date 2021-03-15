#!/usr/bin/env bash

. lib.sh

readonly TEAM_NAME=backpack
readonly CHANNEL_NAME=test

token=$(authenticate $USERNAME $PASSWORD)
channel_id=$(get_channel_id_by_team_name_and_channel_name $token $TEAM_NAME $CHANNEL_NAME)
file_path=$(realpath "$0")
for i in {1..7}; do
  file_id=$(upload_file $token $channel_id "$file_path")
  message=$(lorem -p 3)
  post_id=$(create_post $token $channel_id "$message" $file_id)
done
