FROM docker.io/heywoodlh/archlinux:latest

ENV GO111MODULE=on
WORKDIR /app

COPY go.mod .

RUN pacman -Sy --overwrite=* --needed --noconfirm go git && \
    rm -rfv /var/cache/pacman/* /var/lib/pacman/sync/* && \
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.46.2 && \
    go mod download
