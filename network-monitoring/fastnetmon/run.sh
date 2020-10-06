#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../lib/lib.sh

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
    $IMAGE_NAME
}

run
print_container_info $CONTAINER_NAME
