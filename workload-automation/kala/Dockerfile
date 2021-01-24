FROM golang:1.15.7 AS builder

ARG VERSION
ARG IMAGE_NAME

LABEL $IMAGE_NAME-stage=builder

RUN git clone https://github.com/ajvb/kala.git --branch v${VERSION} --depth 1 \
  && cd kala \
  && go build

FROM ubuntu:20.04 AS target

ENV KALA_HOME=/kala

COPY --from=builder /go/kala/kala $KALA_HOME/
COPY --from=builder /go/kala/webui/ $KALA_HOME/webui/
ADD container/target/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       curl `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG TINI_VERSION=0.19.0
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-amd64 /usr/sbin/tini
RUN chmod +x /usr/sbin/tini

WORKDIR $KALA_HOME

ENTRYPOINT ["tini", "--", "./kala", "serve"]
