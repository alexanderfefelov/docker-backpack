#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

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
    --volume $CONTAINER_NAME-conf:/fastnetmon/conf \
    --volume $CONTAINER_NAME-log:/fastnetmon/log \
    --volume $CONTAINER_NAME-log-attack:/var/log/fastnetmon_attacks \
    --volume $CONTAINER_NAME-scripts:/fastnetmon/scripts \
    --publish 2055:2055/udp \
    --env GRAPHITE_HOST=$GRAPHITE_HOST \
    --env GRAPHITE_PORT=$GRAPHITE_PORT \
    --env REDIS_HOST=$REDIS_HOST \
    --env REDIS_PORT=$REDIS_PORT \
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
print_container_info $CONTAINER_NAME
