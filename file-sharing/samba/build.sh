#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

export SAMBA_USERNAME SAMBA_PASSWORD SAMBA_GID SAMBA_GROUP
docker build \
  --build-arg SAMBA_USERNAME \
  --build-arg SAMBA_PASSWORD \
  --build-arg SAMBA_GID \
  --build-arg SAMBA_GROUP \
  --tag $IMAGE_NAME \
  .
