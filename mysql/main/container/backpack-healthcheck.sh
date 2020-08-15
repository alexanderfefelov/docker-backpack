#!/bin/sh

mysql --host=localhost --port=3306 --user=$HEALTHCHECK_USERNAME --password=$HEALTHCHECK_PASSWORD --execute="SELECT version();" 2>&1 > /dev/null
