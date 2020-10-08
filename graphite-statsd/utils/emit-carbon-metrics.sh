#!/usr/bin/env bash

readonly HOST=graphite-statsd.backpack.test
readonly PORT=2003

echo Sending metrics to $HOST:$PORT...
for i in {1..42}; do
  metric=test.backpack.carbon.metric.$i
  value=$(echo $((RANDOM % 100)))
  timestamp=$(date +%s)
  message="$metric $value $timestamp"
  echo $message
  echo $message | nc -N $HOST $PORT
done
echo ...done
