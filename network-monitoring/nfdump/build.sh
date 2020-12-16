#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh

export IMAGE_NAME
docker build \
  --build-arg VERSION \
  --build-arg IMAGE_NAME \
  --tag $IMAGE_NAME:$VERSION \
  .
