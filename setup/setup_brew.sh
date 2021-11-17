#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# install Homebrew

if ! which brew &>/dev/null; then
	sudo -v
	echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	brew tap homebrew/bundle
	brew tap homebrew/cask
	brew tap homebrew/cask-drivers
	brew tap homebrew/cask-fonts
	brew tap homebrew/cask-versions
	brew tap homebrew/core
	brew tap homebrew/services
	set +e
	brew doctor
	set -e
	brew update --verbose
fi
