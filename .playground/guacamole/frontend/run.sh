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

initialize_users() {
  echo Initializing users...

  local token

  # Create users
  #
  token=$( \
    $HTTP --form --body POST $API/tokens $AUTH \
      | jq --raw-output .authToken \
  )
  jq --compact-output --raw-output '.[] | .username, .permissions' < init/permissions.json | paste --delimiters='|' - - | \
  while IFS='|' read -r username permissions; do
    echo $permissions > temp-json.generated
    $HTTP PATCH $API_SESSION/users/$username/permissions token==$token < temp-json.generated
    rm --force temp-json.generated
  done
  $HTTP DELETE $API/tokens/$token

  AUTH="username=admin_reuphoodeixu password=zaicieceifox"

  # Remove default admin user
  #
  token=$( \
    $HTTP --form --body POST $API/tokens $AUTH \
      | jq --raw-output .authToken \
  )
  $HTTP DELETE $API_SESSION/users/guacadmin token==$token
  $HTTP DELETE $API/tokens/$token

  echo ...users initialized
}

create_connections() {
  echo Creating connections...
  local token
  token=$( \
    $HTTP --form --body POST $API/tokens $AUTH \
      | jq --raw-output .authToken \
  )
  IFS=$'\n'
  for obj in $(jq --compact-output .[] < init/connections.json); do
    echo $obj > temp-json.generated
    $HTTP POST $API_SESSION/connections token==$token < temp-json.generated
    rm --force temp-json.generated
  done
  $HTTP DELETE $API/tokens/$token
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
  create_connections
fi
print_container_info $CONTAINER_NAME
