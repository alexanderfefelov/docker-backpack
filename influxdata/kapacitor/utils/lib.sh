readonly HTTP="http --check-status"
readonly API=http://kapacitor.backpack.test:9092/kapacitor/v1

#
# Arguments:
#   $1 - significant part of the API URL
# Returns:
#   the body of the response
#
execute_get_request() {
  local response=$(
    $HTTP --body \
      GET $API/$1
  )
  echo $response
}
