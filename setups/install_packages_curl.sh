#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
