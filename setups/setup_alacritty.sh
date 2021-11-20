#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Alacritty

# Requirements:
# cargo

# install Alacritty
[[ ! -d "${HOME}"/.oss/alacritty ]] && git clone https://github.com/alacritty/alacritty "${HOME}/.oss/alacrittya"
cd "${HOME}/.oss/alacritty"
rustup override set stable
rustup update stable
make app
cp -r target/release/osx/Alacritty.app /Applications/

# install man
mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null
