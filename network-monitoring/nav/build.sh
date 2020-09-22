#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker build \
  --build-arg NAV_VERSION \
  --tag $IMAGE_NAME .
