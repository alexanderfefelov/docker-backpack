#!/usr/bin/env bash

# https://www.elastic.co/guide/en/logstash/current/node-stats-api.html
http --verbose GET http://logstash.backpack.test:9600/_node/stats/?pretty
