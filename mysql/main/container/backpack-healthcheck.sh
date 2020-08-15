#!/bin/sh

mysql --host=localhost --port=3306 --user=healthcheck_tutedojobu --password=adqafzubjutk --execute="SELECT version();" 2>&1 > /dev/null
