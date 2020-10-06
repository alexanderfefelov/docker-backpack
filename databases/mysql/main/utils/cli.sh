#!/usr/bin/env bash

mysql --host=master.mysql.backpack.test --port=3306 --user=root --password=camycorymicu  "$@"
