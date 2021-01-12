ARG VERSION

FROM fleetdm/fleet:$VERSION

ADD container/ /

USER root

RUN apk add --quiet \
      curl `# For health checks`

USER fleet

ENTRYPOINT ["/backpack-entrypoint.sh"]
CMD ["fleet", "serve", "--config", "/etc/fleet/fleet.yml"]
