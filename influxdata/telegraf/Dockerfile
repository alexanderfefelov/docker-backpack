ARG VERSION

FROM telegraf:$VERSION

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       chrony \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY container/ /

CMD ["telegraf", "--config-directory", "/etc/telegraf/telegraf.d"]
