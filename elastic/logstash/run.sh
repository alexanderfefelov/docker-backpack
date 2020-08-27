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
    --publish 5514:5514 \
    --publish 5514:5514/udp \
    --publish 9600:9600 \
    "$DEFAULT_HEALTH_SETTINGS" \
    "$DEFAULT_LOG_SETTINGS" \
    $IMAGE_NAME
}

wait_for_container_ports() {
  docker run --rm --link $CONTAINER_NAME:foobar martin/wait -p 5514,9600 -t $WAIT_TIMEOUT
}

run
wait_for_container_ports
print_container_info $CONTAINER_NAME
