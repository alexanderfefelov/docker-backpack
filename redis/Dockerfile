FROM redis:6.0.9-alpine

ADD container/ /

RUN apk add --quiet \
      netcat-openbsd `# For health checks`

CMD [ "redis-server", "/etc/redis/redis.conf" ]
