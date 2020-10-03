#!/usr/bin/env bash

. lib.sh

token=$(create_token $USERNAME $PASSWORD)
get_connection_group_tree $token ROOT
delete_token $token
