#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly FIRST_RUN_FLAG=/first-run
readonly INIT_SCRIPTS_DIR=/init

if [ "$1" = "supervisord" ]; then
  navsyncdb --create
  if [ -f $FIRST_RUN_FLAG ]; then
    for f in $INIT_SCRIPTS_DIR/*; do
      case $f in
        *.sh)
          echo "$f"
          bash "$f"
          ;;
        *.sql)
          echo "$f"
          psql --set=ON_ERROR_STOP=1 --file="$f"
          ;;
        *)
          ;;
      esac
    done
    rm --force $FIRST_RUN_FLAG
  fi
fi

exec "$@"
