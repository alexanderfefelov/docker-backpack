#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

readonly INSTANCE_NO=${1?Instance number is not specified}
readonly CONTAINER_NAME=AGENT_${INSTANCE_NO}_CONTAINER_NAME

> $(docker inspect --format='{{.LogPath}}' ${!CONTAINER_NAME})
