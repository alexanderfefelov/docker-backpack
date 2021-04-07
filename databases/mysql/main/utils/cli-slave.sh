#!/usr/bin/env bash

mysql --host=mysql-main-slave.backpack.test --port=3309 --user=root --password=camycorymicu "$@"
