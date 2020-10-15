#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

export FASTNETMON_VERSION IMAGE_NAME
docker build \
  --build-arg FASTNETMON_VERSION \
  --build-arg IMAGE_NAME \
  --tag $IMAGE_NAME \
  .
