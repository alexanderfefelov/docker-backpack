readonly HTTP="http --check-status"
readonly API=metabase.backpack.test:3042/api

execute_get_request() {
  $HTTP \
    GET $API/$1 \
      "${@:2}"
}

execute_post_request() {
  $HTTP \
    POST $API/$1
}
