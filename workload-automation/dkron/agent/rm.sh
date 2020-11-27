#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker rm --force --volumes $AGENT_1_CONTAINER_NAME
docker rm --force --volumes $AGENT_2_CONTAINER_NAME
docker rm --force --volumes $AGENT_3_CONTAINER_NAME
