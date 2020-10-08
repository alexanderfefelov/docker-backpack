#!/usr/bin/env bash

for i in {1..7}; do
  message=$(lorem -p 3)
  echo $message
  logger --server logstash.backpack.test --port 5514 --udp --rfc3164 $message
done
