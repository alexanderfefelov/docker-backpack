readonly HTTP="http --check-status"
readonly API=http://mattermost.backpack.test:8065/api/v4
readonly USERNAME=script_noosoochieza
readonly PASSWORD=7^iengoomoogieV

#
# Arguments:
#   None
# Returns:
#   the body of the response
#
get_server_status() {
  local response=$(
    $HTTP --body \
      GET $API/system/ping \
        get_server_status==true
  )
  echo $response
}

#
# Arguments:
#   $1 - username or email
#   $2 - password
# Returns:
#   bearer token
#
create_token() {
  local token=$(
    $HTTP --headers \
      POST $API/users/login \
      login_id=$1 \
      password=$2 \
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
# Returns:
#   the body of the response
#
execute_get_request() {
  local response=$(
    $HTTP --body \
      GET $API/$2 \
        "Authorization: Bearer $1"
  )
  echo $response
}

#
# Arguments:
#   $1 - bearer token
#   $2 - team name
# Returns:
#   team id
#
get_team_id_by_name() {
  local id=$(
    execute_get_request $1 teams/name/$2 \
    | jq --raw-output .id
  )
  echo $id
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
#   the body of the response
#
create_post() {
  local response=$(
    $HTTP --body \
      POST $API/posts \
        "Authorization: Bearer $1" \
        channel_id=$2 \
        message="$3"
  )
  echo $response
}
