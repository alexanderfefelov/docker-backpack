readonly USERNAME=jolokia_ahkahshoog5u
readonly PASSWORD=niedohque9yu
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://jasperreports.backpack.test:8097/jolokia

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
