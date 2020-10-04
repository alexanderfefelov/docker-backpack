#!/usr/bin/env bash

. lib.sh

token=$(create_token $USERNAME $PASSWORD)
execute_get_request $token bots
