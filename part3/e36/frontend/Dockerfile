# e3.4
# The frontend should be around 432MB when using FROM ubuntu:18.04.
# e3.5
# node ... alpine

# FROM ubuntu:18.04
FROM node:16 as build-stage
# FROM alpine:3.13
# serve to serve the project in port 5000
EXPOSE 5000

WORKDIR /usr/src/app

# Copy all of the source code
COPY . .


# RUN apt-get update && \
#     apt install -y nodejs && \
#     npm install && \
#     npm run build && \
#     npm install -g serve && \
#     rm -rf /var/lib/apt/lists/* && \
#     useradd -m appuser

RUN npm install && \
    npm run build

# FROM alpine:3.13
FROM alpine

WORKDIR /app
#RUN apt-get update && \
#apk add --no-cache curl python3 ca-certificates && \
#RUN apk update && apk add --no-cache nodejs npm ca-certificates && \
RUN apk update && apk add --no-cache nodejs npm ca-certificates && \
    rm -rf node_modules package-lock.json && \
    npm install -g serve && \
    rm -rf /var/cache/apk/* && \
    adduser -D appuser

# RUN apk add --no-cache curl python3 ca-certificates && \
#     curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
#     chmod a+x /usr/local/bin/youtube-dl && \
#     apk del curl && \
#     adduser -D userapp

USER appuser

# COPY --from=build-stage /usr/app/_site/ /usr/share/nginx/html
COPY --from=build-stage /usr/src/app/build /app/build

# And finally the command to run the application
CMD ["serve", "-s", "-l", "5000", "build"]
