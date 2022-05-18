# e3.4
# The frontend should be around 432MB when using FROM ubuntu:18.04.
# e3.5
#

#FROM ubuntu:18.04
FROM node:alpine
# serve to serve the project in port 5000
EXPOSE 5000

WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

RUN apt-get update && \
    apt install -y nodejs && \
    npm install && \
    npm run build && \
    npm install -g serve && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m appuser

USER appuser

# And finally the command to run the application
CMD ["serve", "-s", "-l", "5000", "build"]