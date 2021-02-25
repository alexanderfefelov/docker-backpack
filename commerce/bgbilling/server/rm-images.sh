#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

images=$(docker image ls --quiet --filter reference=$IMAGE_NAME-server | sort | uniq)
[ -z "$images" ] && echo There are no images to remove || docker image rm --force $images

images=$(docker image ls --quiet --filter reference=$IMAGE_NAME-scheduler | sort | uniq)
[ -z "$images" ] && echo There are no images to remove || docker image rm --force $images

images=$(docker image ls --quiet --filter reference=$IMAGE_NAME-base | sort | uniq)
[ -z "$images" ] && echo There are no images to remove || docker image rm --force $images
