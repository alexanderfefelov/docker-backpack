#!/usr/bin/env bash

if [ "$1" = "supervisord" ]; then
  navsyncdb --create
fi

exec "$@"
