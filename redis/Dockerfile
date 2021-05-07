ARG VERSION

FROM redis:$VERSION-alpine

COPY container/ /

RUN apk add --quiet --no-cache \
      netcat-openbsd `# For health checks`

CMD [ "redis-server", "/etc/redis/redis.conf" ]
