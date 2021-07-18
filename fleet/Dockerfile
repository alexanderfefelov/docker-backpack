ARG VERSION

FROM fleetdm/fleet:v$VERSION

COPY container/ /

USER root

RUN apk add --quiet --no-cache \
      curl `# For health checks`

USER fleet

ENTRYPOINT ["/backpack-entrypoint.sh"]
CMD ["fleet", "serve", "--config", "/etc/fleet/fleet.yml"]
