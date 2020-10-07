USERNAME=superuser_brapildehect
PASSWORD=aytoadowmate
readonly HTTP="http --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://elasticsearch.backpack.test:9200

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
