readonly HTTP="http --check-status"
readonly API=http://dkron-server.backpack.test:8900/v1

#
# Arguments:
#   $1 - significant part of the API URL
# Returns:
#   response body
#
execute_get_request() {
  local response=$(
    $HTTP --body \
      GET $API/$1
  )
  echo $response
}

#
# Arguments:
#   $1 - significant part of the API URL
# Returns:
#   response body
#
execute_post_request() {
  local response=$(
    $HTTP --body \
      POST $API/$1
  )
  echo $response
}
