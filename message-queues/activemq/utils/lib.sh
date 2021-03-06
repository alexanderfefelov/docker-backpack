readonly USERNAME=api_manostinerat
readonly PASSWORD=ombelervolpi
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://activemq-node-1.backpack.test:8161/api

#
# Arguments:
#   $1 - significant part of the API URL
#   $2... - request parameters
# Returns:
#   none
#
execute_post_form_request() {
  $HTTP --form \
    POST $API/$1 "${@:2}"
}
