#!/usr/bin/env bash

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

> $(docker inspect --format='{{.LogPath}}' $CONTAINER_NAME)
