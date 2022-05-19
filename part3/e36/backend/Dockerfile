# e3.4
# when using FROM ubuntu:18.04. The backend should be around 351MB.
# The sizes may vary.
# switch to FROM ubuntu:18.04 first
# FROM ubuntu:18.04
# e3.5
# >25M ok
# e3.6
FROM golang:1.16-alpine as build-stage

# serve to serve the project in port 8080
EXPOSE 8080

WORKDIR /usr/src/app

ENV PATH=$PATH:/usr/local/go/bin

# Copy all of the source code
COPY . .

RUN go build
# It will generate a binary named "server"

FROM alpine

COPY --from=build-stage /usr/src/app/server /app/
WORKDIR /app

RUN apk update && \
    rm -rf /var/cache/apk/* && \
    adduser -D appuser

USER appuser

# And finally the command to run the application
CMD ["./server"]