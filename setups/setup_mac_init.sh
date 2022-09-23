#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

echo "running mac setup scripts..."

sudo -v
#./setups/macos_xcode-select.sh
#./setups/setup_brew.sh
#./setups/install_packages_brew_bundle.sh
#./setups/macos_shell.sh
#./setups/macos_dockutil.sh
#./setups/macos_duti.sh
#./setups/macos_mkdir.sh
./setups/macos_mysides.sh
#./setups/setup_git_global_user.sh
#./setups/setup_github_ssh.sh
#./setups/setup_chrome.sh
#./setups/setup_alacritty.sh
#./setups/setup_nnn.sh
#./setups/setup_fnm.sh
#./setups/setup_goenv.sh
#./setups/setup_pyenv.sh
