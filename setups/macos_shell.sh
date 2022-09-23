#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

echo /usr/local/bin/bash >> /etc/shells

chsh -s "$(which zsh)"
