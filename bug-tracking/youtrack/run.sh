#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../lib/lib.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-backup:/opt/youtrack/backups \
    --volume $CONTAINER_NAME-conf:/opt/youtrack/conf \
    --volume $CONTAINER_NAME-data:/opt/youtrack/data \
    --volume $CONTAINER_NAME-log:/opt/youtrack/logs \
    --publish $HOST_PORT:8080 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION $1
}

run "configure $CONFIG"
docker wait $CONTAINER_NAME
docker rm $CONTAINER_NAME
run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
