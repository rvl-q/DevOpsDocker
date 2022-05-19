# e3.4
# The frontend should be around 432MB when using FROM ubuntu:18.04.
# e3.5
# node ... alpine
# e3.6

FROM node:16 as build-stage

# serve to serve the project in port 5000
EXPOSE 5000

WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

RUN npm install && \
    npm run build

FROM alpine

WORKDIR /app

RUN apk update && apk add --no-cache nodejs npm ca-certificates && \
    rm -rf node_modules package-lock.json && \
    npm install -g serve && \
    rm -rf /var/cache/apk/* && \
    adduser -D appuser

USER appuser

COPY --from=build-stage /usr/src/app/build /app/build

# And finally the command to run the application
CMD ["serve", "-s", "-l", "5000", "build"]
