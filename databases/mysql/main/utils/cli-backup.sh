#!/usr/bin/env bash

mysql --host=mysql-main-backup.backpack.test --port=3308 --user=root --password=camycorymicu "$@"
