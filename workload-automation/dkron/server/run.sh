#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh

initialize_dkron() {
  echo Initializing Dkron...
  bash init/create-jobs.sh "$HOST_NAME"
  echo ...Dkron initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-backup:/var/lib/dkron/backup \
    --volume $CONTAINER_NAME-data:/var/lib/dkron/data \
    --volume $CONTAINER_NAME-log:/var/log/dkron \
    --publish 8900:8080 \
    --publish 8910:8946 \
    --publish 8910:8946/udp \
    --publish 8920:6868 \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME \
      agent \
        --server \
        --bootstrap-expect 1 \
        --region test \
        --datacenter backpack \
        --tag host=$HOST_NAME \
        --data-dir /var/lib/dkron/data \
        --statsd-addr graphite-statsd.backpack.test:8125 \
        --enable-prometheus
}

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
initialize_dkron
print_container_info $CONTAINER_NAME
