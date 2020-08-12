#!/usr/bin/env bash

# https://www.elastic.co/guide/en/logstash/current/node-info-api.html
http GET http://logstash.backpack.test:9600/_node?pretty
