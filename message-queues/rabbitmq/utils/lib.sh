readonly HTTP="http --check-status"
readonly USERNAME=admin_peryncrevifu
readonly PASSWORD=tiverbaculsi
readonly API=http://$USERNAME:$PASSWORD@rabbitmq.backpack.test:15672/api

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
