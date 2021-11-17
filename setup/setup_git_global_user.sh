#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# git: create .gitconfig.user for .gitconfig to read

# Requirements:
# git

FILE="$HOME/.gitconfig.user"
if [[ -f "$FILE" ]]; then
  DOTFILES_BACKUP_DIR="$HOME/.dotfiles_bak/$(date +"%Y_%m_%d")"
  # create .dotfiles_backup in homedir
  mkdir -p "$DOTFILES_BACKUP_DIR"
  echo moving existing files to backup:
  mv "$HOME/$FILE" "$DOTFILES_BACKUP_DIR"
fi

echo global user.name:
read -r USER_NAME
echo global user.emal:
read -r USER_EMAL

tee -a "$FILE" <<END
[user]
    name = $USER_NAME
    email = $USER_EMAL
END
