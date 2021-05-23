#!/usr/local/bin/bash
set -euo pipefail

# Finder

COMMANDS=(

)

function echo_defaults {
  for COMMAND in "${COMMANDS[@]}"; do
    echo "$COMMAND"
    ${COMMAND}
  done
}

echo Before:
echo_defaults

defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write -g AppleShowAllExtensions -bool true
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
defaults write -g NSTableViewDefaultSizeMode -int 1
# search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string SCcf
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder ShowTabView -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowPreviewPane -bool true
defaults write com.apple.finder PreviewPaneWidth -int 172
defaults write com.apple.finder SidebarWidth -int 172
defaults write com.apple.finder NewWindowTargetPath -string file://$HOME
defaults write -g AppleShowAllExtensions -bool true
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
defaults write -g NSTableViewDefaultSizeMode -int 1

echo ""
echo After:
echo_defaults
