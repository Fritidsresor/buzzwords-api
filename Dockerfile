FROM golang:1.8.5-alpine3.6

ENV PORT "80"
EXPOSE 80

ADD . /go/src/github.com/hajhatten/buzzwords-api

RUN apk update && \
    apk upgrade && \
    apk add git && \
    rm -rf /var/cache/apk/*

COPY basic_health.sh /local/basic_health.sh
RUN go install github.com/hajhatten/buzzwords-api

CMD ["buzzwords-api"]
