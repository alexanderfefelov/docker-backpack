#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

STUFF=instnwnd.sql
URL=https://github.com/microsoft/sql-server-samples/raw/master/samples/databases/northwind-pubs/$STUFF

wget --quiet --no-clobber $URL
sqlcmd -S sql-server-main.backpack.test,1433 -U sa -P om0EquuChi8a -i $STUFF
rm --force $STUFF
