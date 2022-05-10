# Start from lte 20.04
FROM ubuntu:20.04

# Use /usr/src/app as our workdir. The following instructions will be executed in this location.
WORKDIR /usr/src/app

# install curl
# Does not work behind VPN, I have run with --net host for this.
RUN apt-get update
RUN apt-get -y install curl    

# copy script
COPY curler.sh .

# When running docker run the command will be "curler"
CMD ./curler.sh

# build:
# docker build . -t curler