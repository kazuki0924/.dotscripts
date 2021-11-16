#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Homebrew: brew bundle helper
# if TARGET=$1 is not set, bundle only essentials
# else bundle specific Brewfile by file name releative to ~/.dotfiles/.Brewfile

# e.g. bash brew_bundle.sh brew/.Brewfile_essential

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
  # mapfile -t BREWFILES < <(fd -H ".Brewfile" "$HOME/.dotfiles/.Brewfiles" -E "taps")
  # for BREWFILE in "${BREWFILES[@]}"; do
  #   echo "$BREWFILE"
  #   __bundle "$BREWFILE"
  # done
  __bundle "$HOME/.dotfiles/.Brewfile/$1"
else
  __bundle "$HOME/.dotfiles/.Brewfile/brew/.Brewfile_essential"
  __bundle "$HOME/.dotfiles/.Brewfile/cask/.Brewfile_essential"
  __bundle "$HOME/.dotfiles/.Brewfile/cask/.Brewfile_font"
fi
