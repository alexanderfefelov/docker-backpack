readonly HTTP="http --check-status"
readonly API=http://apm.backpack.test:8200

#
# Arguments:
#   $1 - significant part of the API URL
# Returns:
#   none
#
execute_get_request() {
  $HTTP \
    GET $API/$1
}
