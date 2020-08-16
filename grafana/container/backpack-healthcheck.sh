#!/bin/sh

curl --head --fail --silent --user-agent backpack-healthcheck http://localhost:3000/ > /dev/null
