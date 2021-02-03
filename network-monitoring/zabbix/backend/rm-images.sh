#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

readonly IMAGES=$(docker image ls --quiet --filter reference=$IMAGE_NAME | sort | uniq)
[ -z "$IMAGES" ] && echo There are no images to remove || docker image rm --force $IMAGES
