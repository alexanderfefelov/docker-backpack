#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh

docker build \
  --build-arg RELEASE \
  --build-arg RELEASE_HASH \
  --tag $IMAGE_NAME:$VERSION \
  .
