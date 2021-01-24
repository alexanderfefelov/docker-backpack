FROM golang:1.15.7 AS builder

ARG VERSION
ARG IMAGE_NAME

LABEL $IMAGE_NAME-stage=builder

# Fix for "standard_init_linux.go:219: exec user process caused: no such file or directory" on Alpine
ENV CGO_ENABLED=0

RUN git clone https://github.com/ajvb/kala.git --branch v${VERSION} --depth 1 \
  && cd kala \
  && go build

FROM alpine:3.13 AS target

ENV KALA_HOME=/kala

COPY --from=builder /go/kala $KALA_HOME
COPY --from=builder /go/kala/webui $KALA_HOME

WORKDIR $KALA_HOME

CMD ["./kala", "serve"]
