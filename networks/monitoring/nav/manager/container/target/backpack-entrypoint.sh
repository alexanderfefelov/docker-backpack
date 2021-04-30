#!/usr/bin/env bash

readonly INIT_SCRIPTS_DIR=/init

if [ "$1" = "supervisord" ]; then
  psql --command="select version();" 2>&1 | grep "does not exist"
  if [ $? -eq 0 ]; then
    navsyncdb --create
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
  fi
fi

exec "$@"
