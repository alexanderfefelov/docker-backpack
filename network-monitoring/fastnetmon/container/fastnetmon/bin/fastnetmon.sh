#!/usr/bin/env bash

PID_FILE=/var/run/fastnetmon.pid
CONF_FILE=/fastnetmon/conf/fastnetmon.conf
LOG_FILE=/fastnetmon/log/fastnetmon.log

rm --force $PID_FILE || true

/opt/fastnetmon/fastnetmon \
  --configuration_file $CONF_FILE \
  --log_file $LOG_FILE
