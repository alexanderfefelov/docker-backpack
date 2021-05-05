#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../lib/lib.sh

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
    --volume $CONTAINER_NAME-graphite-conf:/opt/graphite/conf \
    --volume $CONTAINER_NAME-graphite-data:/opt/graphite/storage \
    --volume $CONTAINER_NAME-statsd-conf:/opt/statsd/config \
    --volume $CONTAINER_NAME-log:/var/log \
    --publish 81:8080 \
    --publish 82:80 \
    --publish 2003-2004:2003-2004 \
    --publish 2003:2003/udp \
    --publish 2023-2024:2023-2024 \
    --publish 8125:8125/udp \
    --publish 8126:8126 \
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
fi

run
wait_for_container_ports $CONTAINER_NAME 2003,8080 $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
