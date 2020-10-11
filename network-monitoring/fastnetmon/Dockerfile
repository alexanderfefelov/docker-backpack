FROM ubuntu:20.04 AS builder

ARG IMAGE_NAME
ARG FASTNETMON_VERSION

LABEL $IMAGE_NAME-stage=builder

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       ca-certificates \
       git \
       wget \
  && git clone https://github.com/pavel-odintsov/fastnetmon.git --branch v${FASTNETMON_VERSION} --depth 1 \
  && cd fastnetmon \
  && echo admin@backpack.test | src/fastnetmon_install.pl \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM ubuntu:20.04 AS target

ADD container/target/ /
COPY --from=builder /opt/ /opt/

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       ca-certificates \
       gettext-base \
       jq \
       libpcap0.8 \
       mysql-client \
       netcat `# For health checks` \
       python3-pip \
       uuid-runtime \
  && pip3 --quiet install \
       httpie \
  && mkdir --parents /fastnetmon/log \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/backpack-entrypoint.sh"]
CMD ["/fastnetmon/bin/fastnetmon.sh"]
