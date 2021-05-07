ARG VERSION

FROM rabbitmq:$VERSION

COPY container/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && chown --recursive rabbitmq:rabbitmq /etc/rabbitmq \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*
