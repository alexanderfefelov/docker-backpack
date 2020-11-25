#!/bin/sh

fleet prepare db --config /etc/fleet/fleet.yml

exec "$@"
