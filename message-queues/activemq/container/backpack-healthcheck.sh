#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

nc -z localhost 1883
nc -z localhost 5672
nc -z localhost 8161
nc -z localhost 61613
nc -z localhost 61614
nc -z localhost 61616
