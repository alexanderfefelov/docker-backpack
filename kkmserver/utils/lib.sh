readonly USERNAME=admin_jiemaovaiwei
readonly PASSWORD=aibaebiimiaj
readonly HTTP="http --verbose --check-status --auth-type basic --auth $USERNAME:$PASSWORD"
readonly API=http://kkmserver.backpack.test:5893/Execute

execute_post_request() {
  $HTTP \
    POST $API
}
