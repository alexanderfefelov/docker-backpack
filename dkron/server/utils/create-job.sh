#!/usr/bin/env bash

. lib.sh

readonly JOB_TEMPLATE='{
  "name": "$NAME",
  "displayname": "$DISPLAY_NAME",
  "disabled": false,
  "schedule": "@every ${MINUTES}m",
  "executor": "shell",
  "executor_config": {
    "shell": "true",
    "cwd": "/opt/local/dkron",
    "env": "FOOBAR=BAZQUX",
    "command": "echo Hello, \"$DISPLAY_NAME\" && printenv FOOBAR && pwd && ls -la /var/log/dkron"
  },
  "parent_job": "",
  "dependent_jobs": [
  ],
  "processors": {
    "files": {
      "log_dir": "/var/log/dkron",
      "forward": "true"
    },
    "log": {
      "forward": "true"
    }
  },
  "concurrency": "forbid",
  "retries": 0,
  "timezone": "Europe/Moscow",
  "owner": "Backpack Team",
  "owner_email": "admin@backpack.test",
  "tags": {
    "node": "server"
  },
  "metadata": {
    "$K1": "$V1",
    "$K2": "$V2"
  }
}'

roll_dice() {
  echo $(($RANDOM % 6 + 1))
}

base_name=($(petname --separator " "))
NAME=$(echo ${base_name[@]} | tr ' ' '-')
DISPLAY_NAME=${base_name[@]^}
MINUTES=$(roll_dice)
K1=$(petname --words 1)
V1=$(petname --words 3)
K2=$(petname --words 1)
V2=$(petname --words 3)
echo $NAME

export NAME DISPLAY_NAME MINUTES K1 V1 K2 V2
job=$(envsubst <<< "$JOB_TEMPLATE")
response=$(execute_post_request jobs <<< $(echo $job))
