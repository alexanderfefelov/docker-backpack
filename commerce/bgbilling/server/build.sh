#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh

docker build \
  --build-arg RELEASE \
  --build-arg SET \
  --build-arg COMPONENTS \
  --tag $IMAGE_NAME-base:$VERSION \
  --file Dockerfile-base \
  .

docker build \
  --build-arg IMAGE_NAME \
  --build-arg VERSION \
  --tag $IMAGE_NAME-scheduler:$VERSION \
  --file Dockerfile-scheduler \
  .

docker build \
  --build-arg IMAGE_NAME \
  --build-arg VERSION \
  --tag $IMAGE_NAME-server:$VERSION \
  --file Dockerfile-server \
  .
