# e1.14 hard linked to e1.13
# We need golang 1.16
FROM golang:1.16

# serve to serve the project in port 8080
EXPOSE 8080

WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

# e33 additions
RUN  useradd -m appuser
RUN chown -fR appuser .
USER appuser

# ??? REQUEST_ORIGIN https://example.com
ENV REQUEST_ORIGIN=http://127.0.0.1:5000

# Build
RUN go build

# Test
# RUN go test ./...

# And finally the command to run the application
CMD ["./server"]