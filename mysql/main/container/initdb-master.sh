#!/usr/bin/env bash

. /functions.sh

create_replication_user

. /backpack-functions.sh

create_healthcheck_user
create_backup_user
