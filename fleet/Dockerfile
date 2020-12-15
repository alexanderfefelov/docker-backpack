ARG VERSION

FROM fleetdm/fleet:$VERSION

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks`

ENTRYPOINT ["/backpack-entrypoint.sh"]
CMD ["fleet", "serve", "--config", "/etc/fleet/fleet.yml"]
