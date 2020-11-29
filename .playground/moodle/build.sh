#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

export MOODLE_VERSION
docker build \
  --build-arg MOODLE_VERSION \
  --tag $IMAGE_NAME \
  .
