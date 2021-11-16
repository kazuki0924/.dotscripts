#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# install Homebrew

if ! which brew &>/dev/null; then
  sudo -v
  echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if which brew &>/dev/null; then
  set +e
  brew doctor
  set -e
  brew update --verbose
fi
