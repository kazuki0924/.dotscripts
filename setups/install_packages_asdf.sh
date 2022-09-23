#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# asdf:
# install packages with asdf

# awscli
asdf plugin add awscli
asdf install awscli latest
asdf global awscli latest
