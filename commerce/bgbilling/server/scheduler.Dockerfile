ARG IMAGE_NAME
ARG VERSION

FROM $IMAGE_NAME-base:$VERSION

ADD container/scheduler/ /

CMD ["./start-scheduler.sh"]
