MATTERMOST_HOST=mattermost.backpack.test
MATTERMOST_PORT=8065
MATTERMOST_USERNAME=fastnetmon_taeyaiyohsho
MATTERMOST_PASSWORD="8#Shioghaefeim"
. "$LIB_DIR"/mattermost.sh

readonly TEAM_NAME=backpack
readonly CHANNEL_NAME=alerts

timestamp=$(date --iso-8601=seconds)
token=$(authenticate)
channel_id=$(get_channel_id_by_team_name_and_channel_name $token $TEAM_NAME $CHANNEL_NAME)
if [ -s "$DETAILS_FILE" ]; then
  file_id=$(upload_file $token $channel_id "$DETAILS_FILE")
fi
message="**$ALERT_NAME** $timestamp $SUMMARY
$UUID"
post_id=$(create_post $token $channel_id "$message" $file_id)
