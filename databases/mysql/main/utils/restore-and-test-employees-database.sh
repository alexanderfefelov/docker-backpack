#!/usr/bin/env bash

# https://dev.mysql.com/doc/employee/en/
TEST_DB_URL=https://github.com/datacharmer/test_db
TEST_DB_VERSION=v1.0.7
TEST_DB_RESTORE_SCRIPT=employees.sql
TEST_DB_TEST_SCRIPT=test_employees_md5.sql

set -e

git clone --quiet $TEST_DB_URL --branch $TEST_DB_VERSION
cd test_db
time ../cli-master.sh --table < $TEST_DB_RESTORE_SCRIPT
time ../cli-master.sh --table < $TEST_DB_TEST_SCRIPT
cd ..
rm --force --recursive test_db
