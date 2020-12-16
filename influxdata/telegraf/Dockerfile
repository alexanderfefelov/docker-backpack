ARG VERSION

FROM telegraf:$VERSION

ADD container/ /

CMD ["telegraf", "--config-directory", "/etc/telegraf/telegraf.d"]
