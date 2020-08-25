#!/bin/sh

set -e

readonly WAIT_TIMEOUT=2

nc -z -w $WAIT_TIMEOUT localhost 139
nc -z -w $WAIT_TIMEOUT localhost 445
