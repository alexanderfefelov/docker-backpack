#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../lib/lib.sh

readonly MYSQL="mysql --host=$DB_HOST --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  $MYSQL --execute="
    CREATE DATABASE $DB_DATABASE;
    CREATE USER '$DB_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$DB_PASSWORD';
    GRANT ALL ON $DB_DATABASE.* TO '$DB_USERNAME'@'%';
  "
  echo ...database initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --publish 4440:4440 \
    --env RUNDECK_SERVER_UUID=$PRIMARY_SERVER_ID \
    --env RUNDECK_PRIMARYSERVERID=$PRIMARY_SERVER_ID \
    --env RUNDECK_DATABASE_DRIVER=$DB_DRIVER \
    --env RUNDECK_DATABASE_URL=$DB_URL \
    --env RUNDECK_DATABASE_USERNAME=$DB_USERNAME \
    --env RUNDECK_DATABASE_PASSWORD=$DB_PASSWORD \
    --env RUNDECK_GRAILS_URL=http://rundeck.backpack.test:4440 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}

$MYSQL --execute="use $DB_DATABASE;"
if [ $? -ne 0 ]; then
  initialize_database
fi

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
