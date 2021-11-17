#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Alacritty

# Requirements:
# cargo

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
# See https://gist.github.com/cowboy/3118588
sudo -v
while true; do
  sudo -n true
  sleep 10
  kill -0 "$$" || exit
done 2>/dev/null &

# install Alacritty
git clone https://github.com/alacritty/alacritty "$HOME"/.oss/alacritty
cd "$HOME"/.oss/alacritty || exit
rustup override set stable
rustup update stable
make app
cp -r target/release/osx/Alacritty.app /Applications/

# install man
mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null
