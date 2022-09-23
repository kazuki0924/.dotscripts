#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# install Homebrew

if which brew &>/dev/null; then
  export NONINTERACTIVE=1
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew tap homebrew/bundle
	brew tap homebrew/cask
	brew tap homebrew/cask-drivers
	brew tap homebrew/cask-fonts
	brew tap homebrew/cask-versions
	brew tap homebrew/core
	brew tap homebrew/services
	set +e
	brew doctor
	brew cleanup
	brew update --verbose
	set -e
fi
