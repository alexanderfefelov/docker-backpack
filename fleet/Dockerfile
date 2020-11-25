FROM fleetdm/fleet:3.4.0

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks`

ENTRYPOINT ["/backpack-entrypoint.sh"]
CMD ["fleet", "serve", "--config", "/etc/fleet/fleet.yml"]
