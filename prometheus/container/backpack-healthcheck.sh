#!/bin/sh

readonly WAIT_TIMEOUT=2

nc -z -w $WAIT_TIMEOUT localhost 9090
