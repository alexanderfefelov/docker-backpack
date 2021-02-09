readonly USERNAME=telegraf_guaduquainti
readonly PASSWORD=moncentivenv
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://activemq-node-1.backpack.test:8161/api/jolokia

#
# Arguments:
#   $1 - significant part of the API URL
#   $2... - request parameters
# Returns:
#   none
#
execute_get_request() {
  $HTTP \
    GET $API/$1 "${@:2}" \
      "Origin: http://example.com"
}
