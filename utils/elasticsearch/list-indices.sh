#!/usr/bin/env bash

# https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-indices.html
http GET http://elasticsearch.backpack.test:9200/_cat/indices
