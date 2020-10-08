readonly MATTERMOST_HOST=${MATTERMOST_HOST:-mattermost.test}
readonly MATTERMOST_PORT=${MATTERMOST_PORT:-8065}
readonly MATTERMOST_USERNAME=${MATTERMOST_USERNAME:-username}
readonly MATTERMOST_PASSWORD=${MATTERMOST_PASSWORD:-password}

readonly MATTERMOST_API=http://$MATTERMOST_HOST:$MATTERMOST_PORT/api/v4
readonly MATTERMOST_HTTP="http --check-status --ignore-stdin"

#
# Arguments:
#   none
# Returns:
#   bearer token
#
authenticate() {
  local token=$(
    $MATTERMOST_HTTP --headers \
      POST $MATTERMOST_API/users/login \
        login_id=$MATTERMOST_USERNAME \
        password=$MATTERMOST_PASSWORD \
    | grep Token: \
    | cut --delimiter=: --fields=2 \
    | xargs
  )
  echo $token
}

#
# Arguments:
#   $1 - bearer token
#   $2 - significant part of the API URL
#   $3... - request parameters
# Returns:
#   response body
#
execute_get_request() {
  local response=$(
    $MATTERMOST_HTTP --body \
      GET $MATTERMOST_API/$2 \
        "Authorization: Bearer $1" \
        "${@:3}"
  )
  echo $response
}

#
# Arguments:
#   $1 - bearer token
#   $2 - significant part of the API URL
#   $3... - request parameters
# Returns:
#   response body
#
execute_post_request() {
  local response=$(
    $MATTERMOST_HTTP --body \
      POST $MATTERMOST_API/$2 \
        "Authorization: Bearer $1" \
        "${@:3}"
  )
  echo $response
}

#
# Arguments:
#   $1 - bearer token
#   $2 - team name
#   $3 - channel name
# Returns:
#   channel id
#
get_channel_id_by_team_name_and_channel_name() {
  local id=$(
    execute_get_request $1 teams/name/$2/channels/name/$3 \
    | jq --raw-output .id
  )
  echo $id
}

#
# Arguments:
#   $1 - bearer token
#   $2 - channel id
#   $3 - message
# Returns:
#   message id
#
create_post() {
  local id=$(
    execute_post_request $1 posts channel_id=$2 message="$3" \
    | jq --raw-output .id
  )
  echo $id
}
