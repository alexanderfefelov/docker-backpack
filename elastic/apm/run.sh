#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --publish 8200:8200 \
    "$DEFAULT_GO_SETTINGS" \
    "$DEFAULT_HEALTH_SETTINGS" \
    "$DEFAULT_LOG_SETTINGS" \
    $IMAGE_NAME
}

wait_for_ports() {
  docker run --rm --link $CONTAINER_NAME:foobar martin/wait -t $WAIT_TIMEOUT
}

run_tests() {
  docker exec $CONTAINER_NAME /usr/share/apm-server/apm-server test config
  docker exec $CONTAINER_NAME /usr/share/apm-server/apm-server test output
}

print_info() {
  echo $CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME)
}

run
wait_for_ports
run_tests
print_info
