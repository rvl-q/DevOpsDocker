# e3.4
# when using FROM ubuntu:18.04. The backend should be around 351MB.
# The sizes may vary.
# switch to FROM ubuntu:18.04 first
FROM ubuntu:18.04

# serve to serve the project in port 8080
EXPOSE 8080

WORKDIR /usr/src/app

ENV PATH=$PATH:/usr/local/go/bin

# Copy all of the source code
COPY . .

# We need golang 1.16
# https://go.dev/dl/go1.16.15.linux-amd64.tar.gz
# $ rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz
# export PATH=$PATH:/usr/local/go/bin
# joining
RUN apt-get update && apt-get install -y wget && \
    wget https://go.dev/dl/go1.16.15.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.16.15.linux-amd64.tar.gz && \
    go build && \
    rm -f go1.16.15.linux-amd64.tar.gz && \
    apt-get purge -y --auto-remove wget && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m appuser

# maybe tarfilr could have been mounted?

# ??? REQUEST_ORIGIN https://example.com
# ENV REQUEST_ORIGIN=http://127.0.0.1:5000

# Build

# Test
# RUN go test ./...

# e33 additions
# RUN chown -fR appuser .
USER appuser

# And finally the command to run the application
CMD ["./server"]