#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly NAV_VERSION=90d9a11
readonly NAV_HOME=/.build/usr/local/lib/python3.7/site-packages/nav

patch $NAV_HOME/ipdevpoll/neighbor.py           /nav-add-ons/snmp/patches/nav/ipdevpoll/neighbor.py-$NAV_VERSION.patch
patch $NAV_HOME/ipdevpoll/plugins/interfaces.py /nav-add-ons/snmp/patches/nav/ipdevpoll/plugins/interfaces.py-$NAV_VERSION.patch
patch $NAV_HOME/ipdevpoll/plugins/sensors.py    /nav-add-ons/snmp/patches/nav/ipdevpoll/plugins/sensors.py-$NAV_VERSION.patch
patch $NAV_HOME/ipdevpoll/plugins/statsystem.py /nav-add-ons/snmp/patches/nav/ipdevpoll/plugins/statsystem.py-$NAV_VERSION.patch
patch $NAV_HOME/ipdevpoll/shadows/__init__.py   /nav-add-ons/snmp/patches/nav/ipdevpoll/shadows/__init__.py-$NAV_VERSION.patch

patch $NAV_HOME/models/manage.py                /nav-add-ons/web/patches/nav/models/manage.py-$NAV_VERSION.patch
patch $NAV_HOME/web/info/searchproviders.py     /nav-add-ons/web/patches/nav/web/info/searchproviders.py-$NAV_VERSION.patch
patch $NAV_HOME/web/info/room/views.py          /nav-add-ons/web/patches/nav/web/info/room/views.py-$NAV_VERSION.patch
