#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh

readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"
  echo ...database initialized
}

loda_dump() {
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/BGBillingServer/data \
    --volume $CONTAINER_NAME-dyn:/BGBillingServer/dyn \
    --volume $CONTAINER_NAME-log:/BGBillingServer/log \
    --volume $CONTAINER_NAME-web:/BGBillingServer/webroot \
    --publish 8098:8080 \
    --publish 8099:8778 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}

$MYSQL --execute="USE $DB_DATABASE;"
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  initialize_database
  load_dump
fi

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
