#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-health.html
http --verbose GET http://elasticsearch.backpack.test:9200/_cluster/health/?pretty
