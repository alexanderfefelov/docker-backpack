#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

export IMAGE_NAME
export FASTNETMON_VERSION=1.1.7

docker build \
  --build-arg IMAGE_NAME \
  --build-arg FASTNETMON_VERSION \
  --tag $IMAGE_NAME .
