#!/usr/bin/env bash

# https://www.elastic.co/guide/en/elasticsearch/reference/current/security-api-get-role.html
http --verbose --auth-type basic --auth superuser_brapildehect:aytoadowmate GET http://elasticsearch.backpack.test:9200/_security/role
