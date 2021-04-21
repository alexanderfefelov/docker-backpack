#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

cd $APP_HOME

. functions.sh
. settings.sh

print_banner

java $JAVA_OPTIONS $STARTUP_CLASS -p$LISTENER_PORT -estart 2>&1 | tee --append log/scheduler.out
