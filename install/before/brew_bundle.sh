#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Homebrew: brew bundle helper
# if TARGET=$1 is not set, bundle all Brewfiles
# else bundle specific Brewfile by dir name
# e.g. bash brew_bundle.sh cask/after 

if which ! brew &>/dev/null; then
  echo homebrew must be installed.
  exit 1
fi

__bundle() {
  brew bundle --verbose --no-lock --file="$1"
}

set +e
brew doctor
brew update --verbose
set -e

mapfile -t TAPS < <(fd -H . "$HOME/.dotfiles/.Brewfiles/tap")

for TAP in "${TAPS[@]}"; do
  __bundle "$TAP"
done

TARGET="${1-}"

if [[ -z "$TARGET" ]]; then
  mapfile -t BREWFILES < <(fd -H ".Brewfile" "$HOME/.dotfiles/.Brewfiles" -E "taps")
  for BREWFILE in "${BREWFILES[@]}"; do
    echo "$BREWFILE"
    __bundle "$BREWFILE"
  done
else
  __bundle "$HOME/.dotfiles/$TARGET/.Brewfile"
fi
