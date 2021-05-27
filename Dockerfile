# --- builder ---
# golang:alpine3.13
FROM golang:latest AS build
COPY . .
RUN unset GOPATH && \
    CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o /go/bin/tfswitch

# --- realease ---
# alpine3.13
FROM alpine:latest AS release
COPY --from=build /go/bin/tfswitch /usr/bin/tfswitch

# --- test ---
FROM release as test
RUN tfswitch -u