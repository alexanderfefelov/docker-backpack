FROM golang:1.15.7 AS builder

ARG VERSION
ARG IMAGE_NAME

LABEL $IMAGE_NAME-stage=builder

# Fix for "standard_init_linux.go:219: exec user process caused: no such file or directory" on Alpine
ENV CGO_ENABLED=0

RUN git clone https://github.com/ajvb/kala.git --branch v${VERSION} --depth 1 \
  && cd kala \
  && go build \
  && mv kala /usr/bin

FROM alpine:3.13 AS target

COPY --from=builder /usr/bin/kala /usr/bin

CMD ["kala", "serve"]
