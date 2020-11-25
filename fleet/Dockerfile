FROM fleetdm/fleet:3.4.0

ADD container/ /

ENTRYPOINT ["/backpack-entrypoint.sh"]
CMD ["fleet", "serve", "--config", "/etc/fleet/fleet.yml"]
