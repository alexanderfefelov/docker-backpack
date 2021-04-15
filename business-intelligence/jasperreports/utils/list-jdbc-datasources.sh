#!/usr/bin/env bash

. lib.sh

execute_get_request resources 'Accept: application/json' type==jdbcDataSource
