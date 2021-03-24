#!/usr/bin/env bash

readonly DOCKER_EXEC="docker exec --tty --interactive backpack-nav-manager"

readonly HTTP="http --check-status"
readonly API=http://nav-manager.backpack.test:83/api/1
readonly TOKEN=aer9tei2ohsheiv5cae2ohCh3biz6kaf2pieDi0gee

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
