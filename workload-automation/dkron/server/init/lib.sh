readonly HTTP="http --check-status"
readonly API="http://dkron-server-1.backpack.test:8900/v1"

execute_post_request() {
  local response=$(
    $HTTP --body \
      POST $API/$1
  )
  echo $response
}
