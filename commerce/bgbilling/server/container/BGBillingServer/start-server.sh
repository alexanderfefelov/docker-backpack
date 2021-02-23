#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

cd $APP_HOME

. functions.sh
. settings.sh

readonly AGENT="-javaagent:$APP_HOME/jolokia/jolokia-jvm-1.6.2-agent.jar=config=$APP_HOME/jolokia/jolokia.properties"
readonly LOG="-Dlog4j.configuration=data/actual-log4j.xml -Dlog.dir=$APP_HOME/log"
readonly MEMORY="-Xmx500m"
readonly NETWORK="-Djava.net.preferIPv4Stack=true"

readonly JAVA_OPTIONS_APP="
  $AGENT
  $LOG
  $MEMORY
  $NETWORK
"
readonly JAVA_OPTIONS="
  $JAVA_OPTIONS_APP
  $JAVA_OPTIONS_COMMON
"
readonly STARTUP_CLASS=bitel.billing.server.Server

print_banner

java $JAVA_OPTIONS $STARTUP_CLASS start 2>&1 | tee --append log/server.out