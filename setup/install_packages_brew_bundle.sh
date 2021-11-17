#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Homebrew: brew bundle
# if TARGET=$1 is not set, bundle only essentials
# else bundle specific Brewfile by file name releative to ~/.dotfiles/.Brewfile
# e.g. bash brew_bundle.sh brew/.Brewfile_essential

TARGET="${1-}"

REQUIREMENTS=(
  fd
  bash
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

brew_bundle() {
  brew bundle --verbose --no-lock --file="$1"
}

set +e
brew doctor
brew update --verbose
set -e

mapfile -t TAPS < <(fd -H . "$HOME/.dotfiles/.Brewfiles/tap")

for TAP in "${TAPS[@]}"; do
  brew_bundle "$TAP"
done

if [[ -z "$TARGET" ]]; then
  __bundle "$HOME/.dotfiles/.Brewfile/$TARGET"
else
  __bundle "$HOME/.dotfiles/.Brewfile/brew/.Brewfile_essentials"
  __bundle "$HOME/.dotfiles/.Brewfile/cask/.Brewfile_essentials"
  __bundle "$HOME/.dotfiles/.Brewfile/cask/.Brewfile_font"
fi
