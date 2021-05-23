#!/usr/local/bin/bash

# brew bundle

if which brew &>/dev/null; then
  brew doctor
  brew update --verbose
  brew bundle --global --verbose
fi
