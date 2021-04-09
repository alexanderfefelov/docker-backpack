#!/usr/bin/env bash

TEST_DB_REPO=test_db
TEST_DB_TEST_SCRIPT=test_employees_md5.sql

[ ! -d $TEST_DB_REPO ] && echo $TEST_DB_REPO not found && exit 1

(
  cd $TEST_DB_REPO
  time ../../cli-slave.sh --table < $TEST_DB_TEST_SCRIPT
)
