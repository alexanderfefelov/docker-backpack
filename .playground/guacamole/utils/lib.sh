readonly HTTP="http --verbose --check-status"
readonly API=http://frontend.guacamole.backpack.test:8085/guacamole/api
readonly API_SESSION=$API/session/data/mysql
readonly USERNAME=admin_reuphoodeixu
readonly PASSWORD=zaicieceifox

create_token() {
  local response="$($HTTP --form --body POST $API/tokens username=$1 password=$2)"
  local token=$(echo $response | jq --raw-output .authToken)
  echo $token
}

delete_token() {
  $HTTP DELETE $API/tokens/$1
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
