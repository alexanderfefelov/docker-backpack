readonly USERNAME=jolokia_up8reph3shap
readonly PASSWORD=peiph0haimie
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://h2.backpack.test:8015/jolokia

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
