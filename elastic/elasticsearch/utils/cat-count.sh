#!/usr/bin/env bash

. lib.sh

# https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-count.html
execute_get_request _cat/count v==
