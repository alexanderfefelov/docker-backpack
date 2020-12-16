ARG VERSION

FROM redis:$VERSION-alpine

ADD container/ /

RUN apk add --quiet \
      netcat-openbsd `# For health checks`

CMD [ "redis-server", "/etc/redis/redis.conf" ]
