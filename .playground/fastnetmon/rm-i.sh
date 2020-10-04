#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

yes | docker image prune --filter label=$IMAGE_NAME-stage=builder
docker image rm $IMAGE_NAME
