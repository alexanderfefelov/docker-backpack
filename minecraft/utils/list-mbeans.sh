#!/usr/bin/env bash

readonly USERNAME=jolokia_dahhegeedahg
readonly PASSWORD=ahyaquaexiew
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://minecraft.backpack.test:25576/jolokia

#
# Arguments:
#   $1 - significant part of the API URL
#   $2... - request parameters
# Returns:
#   none
#
execute_get_request() {
  $HTTP \
    GET $API/$1 "${@:2}"
}

execute_get_request list
