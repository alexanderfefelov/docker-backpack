#!/usr/bin/env bash

readonly HOST=influxdb.backpack.test
readonly PORT=2013

echo Sending metrics to $HOST:$PORT...
for i in {1..42}; do
  metric=test.backpack.influxdb.metric.$i
  value=$(echo $((RANDOM % 100)))
  timestamp=$(date +%s)
  message="$metric $value $timestamp"
  echo $message
  nc -N $HOST $PORT <<< $(echo $message)
done
echo ...done
