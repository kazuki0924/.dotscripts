#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# nnn

# Requirements:
# Nerd Font installed

# install nnn
[[ -d "${HOME}/.oss/nnn" ]] && trash-put "${HOME}/.oss/nnn"
[[ -d "${HOME}/.config/nnn" ]] && trash-put "${HOME}/.config/nnn"
[[ -f /usr/local/bin/nnn ]] && trash-put /usr/local/bin/nnn

[[ ! -d "${HOME}/.oss/nnn" ]] && git clone https://github.com/jarun/nnn "${HOME}/.oss/nnn"
cd "$HOME"/.oss/nnn
# git checkout tags/v4.3
# Close previewer when opening file (#1171)
git checkout 532532704e72156aff140a07f8d7768d596eec02
make O_NERD=1
cp "${HOME}/.oss/nnn/nnn" /usr/local/bin/nnn
mkdir -p "${HOME}/.config/nnn/plugins"
cp -r "${HOME}/.oss/nnn/plugins/" "${HOME}/.config/nnn/plugins"
