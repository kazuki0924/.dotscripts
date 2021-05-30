#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Requirements
which gfind &>/dev/null || brew install findutils
which trash-list &>/dev/null || brew install findutils

gfind "${1-$HOME/.config}" -xtype l -exec trash-put -v {} \;
