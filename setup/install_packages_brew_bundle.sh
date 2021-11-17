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
  brew_bundle "$HOME/.dotfiles/.Brewfiles/brew/.Brewfile_essentials"
  brew_bundle "$HOME/.dotfiles/.Brewfiles/cask/.Brewfile_essentials"
  brew_bundle "$HOME/.dotfiles/.Brewfiles/cask/.Brewfile_font"
else
  brew_bundle "$HOME/.dotfiles/.Brewfiles/$TARGET"
fi
