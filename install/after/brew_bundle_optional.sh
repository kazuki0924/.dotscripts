#!/usr/local/bin/bash

# brew bundle optional

if which brew &>/dev/null; then
  brew doctor
  brew update --verbose
  brew bundle --file="$HOME/.Brewfile_optional" --verbose
fi
