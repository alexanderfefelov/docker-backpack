#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo  --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../lib/lib.sh

readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"
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
    $IMAGE_NAME:$VERSION
}

check_containers "$REQUIRED_CONTAINERS" || exit 1

$MYSQL --execute="USE $DB_DATABASE;"
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  initialize_database
fi

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
