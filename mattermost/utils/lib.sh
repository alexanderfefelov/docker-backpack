readonly HTTP="http --check-status"
readonly API=http://mattermost.backpack.test:8065/api/v4
readonly USERNAME=script_noosoochieza
readonly PASSWORD=7^iengoomoogieV

#
# Arguments:
#   none
# Returns:
#   response body
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
authenticate() {
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
#   response body
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
#   $2 - significant part of the API URL
#   $3... - request parameters
# Returns:
#   response body
#
execute_post_request() {
  local response=$(
    $HTTP --body \
      POST $API/$2 \
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
execute_post_form_request() {
  local response=$(
    $HTTP --form --body \
      POST $API/$2 \
        "Authorization: Bearer $1" \
        "${@:3}"
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
#   $4 - file id
# Returns:
#   message id
#
create_post() {
  local id=$(
    execute_post_request $1 posts channel_id=$2 message="$3" file_ids:="[\"$4\"]" \
    | jq --raw-output .id
  )
  echo $id
}

#
# Arguments:
#   $1 - bearer token
#   $2 - channel id
#   $3 - file path
# Returns:
#   file id
#
upload_file() {
  local id=$(
    execute_post_form_request $1 files channel_id==$2 files@"$3" \
    | jq --raw-output .file_infos[0].id
  )
  echo $id
}
