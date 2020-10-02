#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh

readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"
readonly HTTP=http
readonly API=http://frontend.guacamole.backpack.test:8085/guacamole/api
readonly API_SESSION=$API/session/data/mysql
AUTH="username=guacadmin password=guacadmin"
readonly TEMP_JSON_FILE=temp.json.generated

initialize_database() {
  echo Initializing database...
  $MYSQL --execute="
    CREATE DATABASE $DB_DATABASE;
    CREATE USER IF NOT EXISTS '$DB_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$DB_PASSWORD';
    GRANT ALL ON $DB_DATABASE.* TO '$DB_USERNAME'@'%';
  "
  docker run --rm guacamole/guacamole:1.2.0 /opt/guacamole/bin/initdb.sh --mysql > init/db.sql.generated
  $MYSQL $DB_DATABASE < init/db.sql.generated
  rm --force initdb.sql.generated
  echo ...database initialized
}

create_token() {
  local token
  token=$($HTTP --form --body POST $API/tokens $1 | jq --raw-output .authToken)
  echo $token
}

delete_token() {
  $HTTP --body DELETE $API/tokens/$1
}

initialize_users() {
  echo Initializing users...
  local token
  token=$(create_token $AUTH)
  IFS=$'\n'
  for obj in $(jq --compact-output .[] < init/users.json); do
    echo $obj > $TEMP_JSON_FILE
    $HTTP POST $API_SESSION/users token==$token < $TEMP_JSON_FILE
    rm --force $TEMP_JSON_FILE
  done
  delete_token $token
  echo ...users initialized
}

initialize_permissions() {
  echo Initializing permissions...
  local token
  token=$(create_token $AUTH)
  jq --compact-output --raw-output '.[] | .username, .permissions' < init/permissions.json | paste --delimiters='|' - - | \
  while IFS='|' read -r username permissions; do
    echo $permissions > $TEMP_JSON_FILE
    $HTTP PATCH $API_SESSION/users/$username/permissions token==$token < $TEMP_JSON_FILE
    rm --force $TEMP_JSON_FILE
  done
  delete_token $token
  echo ...permissions initialized
}

delete_guacadmin() {
  echo Deleting guacadmin...
  token=$(create_token $AUTH)
  $HTTP DELETE $API_SESSION/users/guacadmin token==$token
  delete_token $token
  echo ...guacadmin deleted
}

create_connections() {
  echo Creating connections...
  local token
  token=$(create_token $AUTH)
  IFS=$'\n'
  for obj in $(jq --compact-output .[] < init/connections.json); do
    echo $obj > $TEMP_JSON_FILE
    $HTTP POST $API_SESSION/connections token==$token < $TEMP_JSON_FILE
    rm --force $TEMP_JSON_FILE
  done
  delete_token $token
  echo ...connections created
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --publish 8085:8080 \
    --env GUACD_HOSTNAME=backend.guacamole.backpack.test \
    --env GUACD_PORT=4822 \
    --env MYSQL_HOSTNAME=$DB_HOST \
    --env MYSQL_PORT=$DB_PORT \
    --env MYSQL_DATABASE=$DB_DATABASE \
    --env MYSQL_USER=$DB_USERNAME \
    --env MYSQL_PASSWORD=$DB_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}

$MYSQL --execute="use $DB_DATABASE;"
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  readonly FIRST_RUN=true
  initialize_database
fi

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
if [ "$FIRST_RUN" == "true" ]; then
  initialize_users
  initialize_permissions
  AUTH="username=admin_reuphoodeixu password=zaicieceifox"
  delete_guacadmin
  create_connections
fi
print_container_info $CONTAINER_NAME
