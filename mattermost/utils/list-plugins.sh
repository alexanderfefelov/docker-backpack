#!/usr/bin/env bash

. lib.sh

token=$(authenticate $USERNAME $PASSWORD)
execute_get_request $token plugins
