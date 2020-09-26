#!/usr/bin/env bash

readonly FIRST_RUN_SCRIPT=/first-run.sh

if [ "$1" = "supervisord" ]; then
  navsyncdb --create
  if [ -x /first-run.sh ]; then
    $FIRST_RUN_SCRIPT
    rm --force $FIRST_RUN_SCRIPT
  fi
fi

exec "$@"
