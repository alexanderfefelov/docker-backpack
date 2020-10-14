#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

> $(docker inspect --format='{{.LogPath}}' $NODE_3_CONTAINER_NAME)
