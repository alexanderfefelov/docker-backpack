#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. lib.sh

$DOCKER_EXEC bash -c '
  set -e
  readonly DUMP_DIR=/var/lib/nav/navdump
  echo Dump directory: $DUMP_DIR
  read -p "Existing dump files will be overwritten. Press Y to continue: " -n 1 -r
  echo
  if [ "$REPLY" != "Y" ]; then
    exit
  fi
  mkdir --parents $DUMP_DIR
  cd $DUMP_DIR
  navdump --all
'
