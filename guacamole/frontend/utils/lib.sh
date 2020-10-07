readonly HTTP="http --verbose --check-status"
readonly API=http://frontend.guacamole.backpack.test:8085/guacamole/api
readonly API_SESSION=$API/session/data/mysql
readonly USERNAME=admin_reuphoodeixu
readonly PASSWORD=zaicieceifox

create_token() {
  local token=$(
    $HTTP --form --body \
      POST $API/tokens \
        username=$1 \
        password=$2 \
    | jq --raw-output .authToken
  )
  echo $token
}

delete_token() {
  $HTTP \
    DELETE $API/tokens/$1
}

get_connection_groups() {
  $HTTP --body \
    GET $API_SESSION/connectionGroups \
      token==$1
}

get_connection_group_details() {
  $HTTP --body \
    GET $API_SESSION/connectionGroups/$2 \
      token==$1
}

get_connection_group_tree() {
  $HTTP --body \
    GET $API_SESSION/connectionGroups/$2/tree \
      token==$1
}

get_connections() {
  $HTTP --body \
    GET $API_SESSION/connections \
      token==$1
}

get_connection_details() {
  $HTTP --body \
    GET $API_SESSION/connections/$2 \
      token==$1
}

get_connection_parameters() {
  $HTTP --body \
    GET $API_SESSION/connections/$2/parameters \
      token==$1
}

get_user_groups() {
  $HTTP --body \
    GET $API_SESSION/userGroups \
      token==$1
}

get_user_group_details() {
  $HTTP --body \
    GET $API_SESSION/userGroups/$2 \
      token==$1
}

get_user_group_members() {
  $HTTP --body \
    GET $API_SESSION/userGroups/$2/memberUsers \
      token==$1
}

get_user_group_permissions() {
  $HTTP --body \
    GET $API_SESSION/userGroups/$2/permissions \
      token==$1
}

get_users() {
  $HTTP --body \
    GET $API_SESSION/users \
      token==$1
}

get_user_details() {
  $HTTP --body \
    GET $API_SESSION/users/$2 \
      token==$1
}

get_user_effective_permissions() {
  $HTTP --body \
    GET $API_SESSION/users/$2/effectivePermissions \
      token==$1
}

get_user_groups() {
  $HTTP --body \
    GET $API_SESSION/users/$2/userGroups \
      token==$1
}

get_user_permissions() {
  $HTTP --body \
    GET $API_SESSION/users/$2/permissions \
      token==$1
}
