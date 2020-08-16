#!/usr/bin/env bash

. /functions.sh

create_replication_account

. /backpack-functions.sh

create_healthcheck_account
create_backup_account
create_telegraf_account
