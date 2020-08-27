#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --publish 5000:5000 \
    "$DEFAULT_HEALTH_SETTINGS" \
    "$DEFAULT_LOG_SETTINGS" \
    $IMAGE_NAME
}

wait_for_ports() {
  docker run --rm --link $CONTAINER_NAME:foobar martin/wait -t $WAIT_TIMEOUT
}

print_info() {
  echo $CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME)
}

run
wait_for_ports
print_info
