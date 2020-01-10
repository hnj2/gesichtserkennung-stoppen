FROM alpine:latest

RUN apk add --update --no-cache make

RUN mkdir /app
WORKDIR /app

USER 1000:1000

COPY watch.sh /bin/watch.sh

CMD watch.sh
