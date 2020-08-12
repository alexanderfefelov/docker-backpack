#!/usr/bin/env bash

# https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-health.html
http GET http://elasticsearch.backpack.test:9200/_cluster/health?pretty
