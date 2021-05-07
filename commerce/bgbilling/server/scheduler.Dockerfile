ARG IMAGE_NAME
ARG VERSION

FROM $IMAGE_NAME-base:$VERSION

COPY container/scheduler/ /

CMD ["./start-scheduler.sh"]
