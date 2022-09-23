#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# golang:
# install packages with go install

# air
# https://github.com/cosmtrek/air
go install github.com/cosmtrek/air@latest

# slit
# https://github.com/tigrawap/slit
go install github.com/tigrawap/slit/cmd/slit@latest

# pistol
# https://github.com/doronbehar/pistol
brew install libmagic asciidoctor
env CGO_ENABLED=1 GO111MODULE=on go get -u github.com/doronbehar/pistol/cmd/pistol

# golines
# https://github.com/segmentio/golines
go install github.com/segmentio/golines@latest

# goimports
# https://pkg.go.dev/golang.org/x/tools/cmd/goimports
go install golang.org/x/tools/cmd/goimports@latest

# go-commitlinter
# https://github.com/masahiro331/go-commitlinter
go install github.com/masahiro331/go-commitlinter@latest

# gci
# https://github.com/daixiang0/gci
go install github.com/daixiang0/gci@latest


