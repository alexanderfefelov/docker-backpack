#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

> $(docker inspect --format='{{.LogPath}}' $NODE_2_CONTAINER_NAME)
