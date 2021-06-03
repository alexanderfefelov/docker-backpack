#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh

docker build \
  --build-arg VERSION \
  --tag $IMAGE_NAME:$VERSION \
  .
