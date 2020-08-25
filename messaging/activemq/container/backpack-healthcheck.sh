#!/bin/sh

readonly WAIT_TIMEOUT=2

nc -z -w $WAIT_TIMEOUT localhost 1883
nc -z -w $WAIT_TIMEOUT localhost 5672
nc -z -w $WAIT_TIMEOUT localhost 8161
nc -z -w $WAIT_TIMEOUT localhost 61613
nc -z -w $WAIT_TIMEOUT localhost 61614
nc -z -w $WAIT_TIMEOUT localhost 61616
