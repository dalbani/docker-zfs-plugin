# syntax=docker/dockerfile:1

FROM golang:1.23.6 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY main.go ./
COPY zfs/ ./zfs

RUN CGO_ENABLED=0 go build
