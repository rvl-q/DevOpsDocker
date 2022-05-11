# We need golang 1.16
FROM golang:1.16

# serve to serve the project in port 5000
EXPOSE 8080

WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

# Build
RUN go build

# Test
# RUN go test ./...

# ??? REQUEST_ORIGIN https://example.com

# And finally the command to run the application
CMD ["./server"]