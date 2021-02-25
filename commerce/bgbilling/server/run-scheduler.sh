#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh

run() {
  docker run \
    --name $SCHEDULER_CONTAINER_NAME \
    --hostname $SCHEDULER_HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $SCHEDULER_CONTAINER_NAME-data:/BGBillingServer/data \
    --volume $SCHEDULER_CONTAINER_NAME-log:/BGBillingServer/log \
    --publish 8100:9066 \
    --publish 8101:8778 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME-scheduler:$VERSION
}

run
wait_for_all_container_ports $SCHEDULER_CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $SCHEDULER_CONTAINER_NAME
