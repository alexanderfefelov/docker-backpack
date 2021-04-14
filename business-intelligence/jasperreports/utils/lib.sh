readonly USERNAME=jasperadmin
readonly PASSWORD=jasperadmin
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD --json"
readonly API=http://jasperreports.backpack.test:8097/jasperserver/rest_v2

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
