FROM golang:latest

ARG VERSION=1.6.0

RUN wget "https://github.com/drone/drone/archive/v$VERSION.tar.gz"
RUN mkdir -p /go/src

RUN tar -xvf "v$VERSION.tar.gz"

WORKDIR "/go/drone-$VERSION/cmd/drone-server"

RUN go install -tags "oss nolimit"
CMD drone-server
