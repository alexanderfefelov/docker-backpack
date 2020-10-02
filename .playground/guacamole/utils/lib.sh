readonly HTTP=http
readonly API=http://frontend.guacamole.backpack.test:8085/guacamole/api
readonly API_SESSION=$API/session/data/mysql
readonly AUTH="username=admin_reuphoodeixu password=zaicieceifox"

create_token() {
  local token
  token=$($HTTP --form --body POST $API/tokens $AUTH | jq --raw-output .authToken)
  echo $token
}

delete_token() {
  $HTTP --body DELETE $API/tokens/$1
}

get_connections() {
  $HTTP --body GET $API_SESSION/connections token==$1
}

get_connection_details() {
  $HTTP --body GET $API_SESSION/connections/$2 token==$1
}

get_connection_parameters() {
  $HTTP --body GET $API_SESSION/connections/$2/parameters token==$1
}

get_users() {
  $HTTP --body GET $API_SESSION/users token==$1
}

get_user_details() {
  $HTTP --body GET $API_SESSION/users/$2 token==$1
}

get_user_permissions() {
  $HTTP --body GET $API_SESSION/users/$2/permissions token==$1
}
