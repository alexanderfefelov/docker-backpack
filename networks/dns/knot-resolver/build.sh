#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh

docker build \
  --build-arg VERSION \
  --tag $IMAGE_NAME:$VERSION \
  .
rm --force container/etc/coredns/hosts.generated
