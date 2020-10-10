#!/usr/bin/env bash

readonly LOGSTASH_HOST=logstash.backpack.test
readonly LOGSTASH_PORT=5514

for i in {1..7}; do
  message=$(lorem -p 3)
  echo $message
  logger --server $LOGSTASH_HOST --port $LOGSTASH_PORT --udp --rfc3164 $message
done
