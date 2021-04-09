#!/usr/bin/env bash

# https://dev.mysql.com/doc/employee/en/

TEST_DB_REPO=test_db
TEST_DB_URL=https://github.com/datacharmer/$TEST_DB_REPO
TEST_DB_VERSION=v1.0.7
TEST_DB_RESTORE_SCRIPT=employees.sql

if [ ! -d $TEST_DB_REPO ]; then
  git clone --quiet $TEST_DB_URL --branch $TEST_DB_VERSION
fi

(
  cd $TEST_DB_REPO
  time ../../cli-master.sh --table < $TEST_DB_RESTORE_SCRIPT
)
