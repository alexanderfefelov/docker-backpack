#!/usr/bin/env bash

MATTERMOST_HOST=mattermost.backpack.test
MATTERMOST_PORT=8065
MATTERMOST_USERNAME=fastnetmon_taeyaiyohsho
MATTERMOST_PASSWORD="8#Shioghaefeim"
. "$LIB_DIR"/mattermost.sh

readonly TEAM_NAME=backpack
readonly CHANNEL_NAME=alerts

token=$(authenticate)
channel_id=$(get_channel_id_by_team_name_and_channel_name $token $TEAM_NAME $CHANNEL_NAME)
message="
$SUMMARY

$DETAILS
"
message_id=$(create_post $token $channel_id "$message")
