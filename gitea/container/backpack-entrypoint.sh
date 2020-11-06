#!/usr/bin/env bash

if [ "$1" = "s6-svscan" ]; then
  gitea migrate
fi

exec "$@"
