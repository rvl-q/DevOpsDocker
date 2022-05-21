# e3.4
# when using FROM ubuntu:18.04. The backend should be around 351MB.
# The sizes may vary.
# switch to FROM ubuntu:18.04 first
# FROM ubuntu:18.04
# e3.5
# <25M ok
# e3.6

### from alpine ###
# FROM golang:1.16-alpine as build-stage

# # serve to serve the project in port 8080
# EXPOSE 8080

# WORKDIR /usr/src/app

# ENV PATH=$PATH:/usr/local/go/bin

# # Copy all of the source code
# COPY . .

# RUN go build
# # It will generate a binary named "server"

# # https://feldspaten.org/2021/05/22/Tiny-Containers/
# # 13 MB!
# # RUN apk update && apk add build-base
# # RUN cd /app && CGO_ENABLED=0 go build -ldflags="-w -s"

# USER appuser

# FROM alpine
# COPY --from=build-stage /usr/src/app/server /app/server

# # And finally the command to run the application
# # CMD ["/app/server"]
# ENTRYPOINT ["/app/server"]


### from SCRATCH ###
FROM golang:1.16-alpine as build

WORKDIR /app

COPY . /app
RUN apk update && apk add build-base
RUN CGO_ENABLED=0 go build -ldflags="-w -s"
# -o server
RUN adduser -D --uid 12345 appuser

FROM scratch
WORKDIR /app
COPY --from=build /app/server /app/server
COPY --from=build /etc/passwd /etc/passwd
USER appuser
ENTRYPOINT ["/app/server"]