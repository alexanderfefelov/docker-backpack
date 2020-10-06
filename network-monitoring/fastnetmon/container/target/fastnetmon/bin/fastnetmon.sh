#!/usr/bin/env bash

rm --force /var/run/fastnetmon.pid || true

/opt/fastnetmon/fastnetmon \
  --configuration_file /fastnetmon/conf/fastnetmon.conf \
  --log_file /fastnetmon/log/fastnetmon.log
