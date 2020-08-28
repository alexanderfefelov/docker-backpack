#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly WAIT_TIMEOUT=2

nc -z -w $WAIT_TIMEOUT localhost 1883
nc -z -w $WAIT_TIMEOUT localhost 5672
nc -z -w $WAIT_TIMEOUT localhost 15672
nc -z -w $WAIT_TIMEOUT localhost 61613
