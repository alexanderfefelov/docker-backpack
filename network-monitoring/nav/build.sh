#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION --preserve-env=ADD_ONS_VERSION bash "$0" "$@"

. settings.sh

export IMAGE_NAME
docker build \
  --build-arg VERSION \
  --build-arg ADD_ONS_VERSION \
  --build-arg IMAGE_NAME \
  --tag $IMAGE_NAME:$VERSION \
  .
