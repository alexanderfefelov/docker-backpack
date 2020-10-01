#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh

readonly MYSQL="mysql --host=$DB_HOST --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  $MYSQL --execute="
    CREATE DATABASE $DB_DATABASE;
    CREATE USER '$DB_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$DB_PASSWORD';
    GRANT ALL ON $DB_DATABASE.* TO '$DB_USERNAME'@'%';
  "
  docker run --rm guacamole/guacamole:1.2.0 /opt/guacamole/bin/initdb.sh --mysql > init/db.sql.generated
  $MYSQL $DB_DATABASE < init/db.sql.generated
  rm --force initdb.sql.generated
  echo ...database initialized
}

initialize_users() {
  echo Initializing users...
  local -r HTTP=http
  local -r API=http://localhost:8085/guacamole/api
  token=$( \
    $HTTP --form --body POST $API/tokens username=guacadmin password=guacadmin \
      | jq --raw-output .authToken \
  )
  $HTTP POST $API/session/data/mysql/users token==$token < init/credentials.json
  $HTTP PATCH $API/session/data/mysql/users/admin_reuphoodeixu/permissions token==$token < init/permissions.json
  $HTTP DELETE $API/tokens/$token
  token=$( \
    $HTTP --form --body POST $API/tokens username=admin_reuphoodeixu password=zaicieceifox \
      | jq --raw-output .authToken \
  )
  $HTTP DELETE $API/session/data/mysql/users/guacadmin token==$token
  $HTTP DELETE $API/tokens/$token
  echo ...users initialized
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
    --env MYSQL_DATABASE=$DB_DATABASE \
    --env MYSQL_USER=$DB_USERNAME \
    --env MYSQL_PASSWORD=$DB_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}

$MYSQL --execute="use $DB_DATABASE;"
if [ $? -ne 0 ]; then
  FIRST_RUN=1
  initialize_database
fi

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
if [ "$FIRST_RUN" == 1 ]; then
  initialize_users
fi
print_container_info $CONTAINER_NAME
