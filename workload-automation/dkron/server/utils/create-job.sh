#!/usr/bin/env bash

. lib.sh

readonly JOB_TEMPLATE=$(< job.template.json)

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
response=$(execute_post_request jobs <<< "$job")
