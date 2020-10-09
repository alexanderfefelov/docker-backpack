readonly ACTIVEMQ_HOST=${ACTIVEMQ_HOST:-activemq.test}
readonly ACTIVEMQ_PORT=${ACTIVEMQ_PORT:-8161}
readonly ACTIVEMQ_USERNAME=${ACTIVEMQ_USERNAME:-username}
readonly ACTIVEMQ_PASSWORD=${ACTIVEMQ_PASSWORD:-password}

readonly ACTIVEMQ_API=http://$ACTIVEMQ_HOST:$ACTIVEMQ_PORT/api
readonly ACTIVEMQ_HTTP="http --check-status --ignore-stdin --auth-type basic --auth $ACTIVEMQ_USERNAME:$ACTIVEMQ_PASSWORD"

#
# Arguments:
#   $1 - significant part of the API URL
#   $2... - request parameters
# Returns:
#   none
#
execute_post_form_request() {
  $ACTIVEMQ_HTTP --form \
    POST $ACTIVEMQ_API/$1 "${@:2}"
}

#
# Arguments:
#   $1 - destination
#   $2 - message
# Returns:
#   none
#
send_message() {
  execute_post_form_request message destination==$1 body="$2"
}
