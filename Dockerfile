# --- builder ---
# https://chemidy.medium.com/create-the-smallest-and-secured-golang-docker-image-based-on-scratch-4752223b7324

# golang:1.16.4-alpine3.13
FROM golang@sha256:9dd1788d4bd0df3006d79a88bda67cb8357ab49028eebbcb1ae64f2ec07be627 AS build
COPY . .
RUN unset GOPATH && \
    CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o /go/bin/tfswitch
# WORKDIR /terraform
# --- realease ---
# alpine3.13
# FROM alpine@sha256:def822f9851ca422481ec6fee59a9966f12b351c62ccb9aca841526ffaa9f748 AS release
FROM scratch as release
# ADD busybox.tar.xz /
WORKDIR /terraform
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /go/bin/tfswitch /tfswitch
# COPY --from=build /bin/ls /
# COPY --from=build /bin/sh /sh
# COPY --from=build /bin/cat /cat
# COPY --from=build /bin/mkdir /mkdir
# tfswitch -u: Testing functionality by installing Terraform
# Since the Terraform binary is less than 100b, it has a minimal effect on final image size
# tfstich -v: this is not a good test and it does not actually check functionality 
