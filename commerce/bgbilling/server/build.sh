#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh

docker build \
  --build-arg RELEASE \
  --build-arg SET \
  --build-arg COMPONENTS \
  --tag $IMAGE_NAME:$VERSION \
  .
