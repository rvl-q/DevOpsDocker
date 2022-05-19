# e3.4
# The frontend should be around 432MB when using FROM ubuntu:18.04.
# e3.5
# node ... alpine

# FROM ubuntu:18.04
# FROM node:alpine
FROM alpine:3.13
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

#RUN apt-get update && \
RUN apk add --no-cache nodejs npm && \
    npm install && \
    npm run build && \
    npm install -g serve && \
    adduser -D appuser

# RUN apk add --no-cache curl python3 ca-certificates && \
#     curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl && \
#     chmod a+x /usr/local/bin/youtube-dl && \
#     apk del curl && \
#     adduser -D userapp

USER appuser

# And finally the command to run the application
CMD ["serve", "-s", "-l", "5000", "build"]
