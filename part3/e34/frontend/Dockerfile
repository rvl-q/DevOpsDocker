# e3.4
# The frontend should be around 432MB when using FROM ubuntu:18.04.
# switch to FROM ubuntu:18.04 first

FROM ubuntu:18.04


# serve to serve the project in port 5000
EXPOSE 5000

WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

# We need node
# FROM node:lts
# the hard way then... (?)
# FROM ubuntu:18.04
# && joining
RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash && \
    apt install -y nodejs && \
    npm install && \
    npm run build && \
    npm install -g serve && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m appuser

# e33 additions
# check: node -v && npm -v

# Is this still valid?
# TIP: You do not have to install anything new outside containers.

# REACT_APP_BACKEND_URL=http://example.com
# ENV REACT_APP_BACKEND_URL=http://127.0.0.1:8080
# Install... (copy before install)
# RUN chown -fR appuser .
USER appuser

# And finally the command to run the application
CMD ["serve", "-s", "-l", "5000", "build"]