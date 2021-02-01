readonly HTTP="http --check-status"
readonly API=http://netbox.backpack.test:8087/api
readonly TOKEN=kaeta2ab1foveen4nua0heeh0baiheizaiNgaec9

#
# Arguments:
#   $1 - significant part of the API URL
# Returns:
#   response body
#
execute_get_request() {
  local response=$(
    $HTTP --body \
      GET $API/$1 \
        "Authorization: Token $TOKEN"
  )
  echo $response
}
