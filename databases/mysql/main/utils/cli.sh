#!/usr/bin/env bash

mysql --host=mysql-main-master.backpack.test --port=3306 --user=root --password=camycorymicu  "$@"
