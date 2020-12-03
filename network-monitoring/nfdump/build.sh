#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

export NFDUMP_VERSION IMAGE_NAME
docker build \
  --build-arg NFDUMP_VERSION \
  --build-arg IMAGE_NAME \
  --tag $IMAGE_NAME \
  .
