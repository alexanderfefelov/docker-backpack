readonly HTTP="http --check-status"
readonly API=http://traefik.backpack.test:8002/api

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
