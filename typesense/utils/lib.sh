readonly HTTP="http --check-status"
readonly API=http://typesense.backpack.test:8108
readonly API_KEY=xa7AMod9quaopho0eiquaike9ATu5viWae2iequ7ch

#
# Arguments:
#   $1 - significant part of the API URL
#   $2... - request parameters
# Returns:
#   none
#
execute_get_request() {
  local response=$(
    $HTTP --body \
      GET $API/$1 \
        "X-TYPESENSE-API-KEY: $API_KEY" \
        "${@:2}"
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
      POST $API/$1 \
        "X-TYPESENSE-API-KEY: $API_KEY"
  )
  echo $response
}
