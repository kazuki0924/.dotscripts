#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# nnn: 

# Requirements:
# Nerd Font installed

# install nnn
git clone https://github.com/jarun/nnn "$HOME"/.oss/nnn
cd "$HOME"/.oss/nnn
make O_NERD=1
trash-put /usr/local/bin/nnn
cp nnn /usr/local/bin

# install nnn plugins:
# https://github.com/jarun/nnn
curl -sL https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | bash
