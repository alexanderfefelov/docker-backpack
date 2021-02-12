FROM golang:1.15.8 AS builder

ARG VERSION
ARG IMAGE_NAME

LABEL $IMAGE_NAME-stage=builder

RUN git clone https://github.com/coredhcp/coredhcp.git \
  && cd coredhcp \
  && git checkout ${VERSION} \
  && cd cmds/coredhcp \
  && go build

FROM ubuntu:20.04 AS target

ENV COREDHCP_HOME=/coredhcp

COPY --from=builder /go/coredhcp/cmds/coredhcp/coredhcp $COREDHCP_HOME/
ADD container/target/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR $COREDHCP_HOME

ENTRYPOINT ["./coredhcp"]
