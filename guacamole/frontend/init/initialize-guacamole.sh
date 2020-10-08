#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly HTTP="http --check-status"
readonly API=http://guacamole-frontend.backpack.test:8085/guacamole/api
readonly API_SESSION=$API/session/data/mysql
readonly LOG_FILE=initialize-guacamole.log
readonly TEMP_JSON_FILE=temp.json.generated

log() {
  echo $1 >> $LOG_FILE
}

create_token() {
  log "Requesting token for $1 / $2"
  local response="$($HTTP --form --body POST $API/tokens username=$1 password=$2)"
  log "Response: $response"
  local token=$(echo $response | jq --raw-output .authToken)
  log "Token received: $token"
  echo $token
}

delete_token() {
  log "Deleting token $1"
  $HTTP DELETE $API/tokens/$1
  log "Token deleted"
}

create_users() {
  log "Creating users, token: $1"
  local IFS=$'\n'
  for obj in $(jq --compact-output .[] < users.json); do
    local IFS=' '
    echo $obj > $TEMP_JSON_FILE
    $HTTP POST $API_SESSION/users token==$1 < $TEMP_JSON_FILE
    rm --force $TEMP_JSON_FILE
  done
  log "Users created"
}

update_permissions() {
  log "Updating permissions, token: $1"
  jq --compact-output --raw-output '.[] | .username, .permissions' < permissions.json | paste --delimiters='|' - - | \
  while IFS='|' read -r username permissions; do
    echo $permissions > $TEMP_JSON_FILE
    $HTTP PATCH $API_SESSION/users/$username/permissions token==$1 < $TEMP_JSON_FILE
    rm --force $TEMP_JSON_FILE
  done
  log "Permissions updated"
}

delete_default_admin() {
  local -r USERNAME=guacadmin
  log "Deleting default admin ($USERNAME), token: $1"
  $HTTP DELETE $API_SESSION/users/guacadmin token==$1
  log "Default admin deleted"
}

create_connections() {
  log "Creating connections, token: $1"
  local IFS=$'\n'
  for obj in $(jq --compact-output .[] < connections.json); do
    local IFS=' '
    echo $obj > $TEMP_JSON_FILE
    $HTTP POST $API_SESSION/connections token==$1 < $TEMP_JSON_FILE
    rm --force $TEMP_JSON_FILE
  done
  log "Connections created"
}

token=$(create_token guacadmin guacadmin)
create_users $token
update_permissions $token
delete_token $token

token=$(create_token admin_reuphoodeixu zaicieceifox)
delete_default_admin $token
create_connections $token
delete_token $token
