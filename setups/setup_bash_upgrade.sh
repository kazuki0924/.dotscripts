#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

brew install bash

sudo -s
echo /usr/local/bin/bash >> /etc/shells
