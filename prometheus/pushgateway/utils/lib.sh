readonly HTTP="http --check-status"
readonly API=http://pushgateway.backpack.test:9091/api/v1

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
