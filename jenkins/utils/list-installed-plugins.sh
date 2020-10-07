#!/usr/bin/env bash

. lib.sh

execute_get_request pluginManager/api/json tree==plugins[longName,shortName,version]
