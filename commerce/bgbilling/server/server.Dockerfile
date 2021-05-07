ARG IMAGE_NAME
ARG VERSION

FROM $IMAGE_NAME-base:$VERSION

COPY container/server/ /

CMD ["./start-server.sh"]
