ARG IMAGE_NAME
ARG VERSION

FROM $IMAGE_NAME-base:$VERSION

ADD container/server/ /

CMD ["./start-server.sh"]
