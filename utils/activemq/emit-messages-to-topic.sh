#!/usr/bin/env bash

for i in {1..7}; do
  message=$(lorem -s 1)
  echo $message
  http --verbose --form POST http://api_manostinerat:ombelervolpi@activemq.backpack.test:8161/api/message?destination=topic://lorem.ipsum body="$message"
done
