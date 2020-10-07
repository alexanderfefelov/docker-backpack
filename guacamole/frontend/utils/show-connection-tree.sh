#!/usr/bin/env bash

. lib.sh

token=$(authenticate $USERNAME $PASSWORD)
get_connection_group_tree $token ROOT
deauthenticate $token
