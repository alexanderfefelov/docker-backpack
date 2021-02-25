#!/usr/bin/env bash

readonly USERNAME=jolokia_jei4cie5Kahg
readonly PASSWORD=eaFai4eTh1re
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://bgbilling-server.backpack.test:8099/jolokia

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
