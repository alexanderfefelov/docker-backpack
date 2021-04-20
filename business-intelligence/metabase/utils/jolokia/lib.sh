#!/usr/bin/env bash

readonly USERNAME=jolokia_feaziphing5w
readonly PASSWORD=shoh1maeciev
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://metabase.backpack.test:3043/jolokia

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
