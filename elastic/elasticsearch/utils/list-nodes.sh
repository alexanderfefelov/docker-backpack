#!/usr/bin/env bash

. lib.sh

# https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-nodes-info.html
execute_get_request _nodes
