readonly USERNAME=api_shehoh9teigu
readonly PASSWORD=meekai6aixey
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://redmine.backpack.test:8095

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
