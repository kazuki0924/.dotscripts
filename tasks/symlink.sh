#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Symbolic links:
# - creates directory and the symbolic links to the host dynamically
# - backup existing file

# Requirements:
# fd

REQUIREMENTS=(
  fd
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

DOT_DIRNAME="${1-".dotfiles"}"

DOTFILES_DIR="$HOME/$DOT_DIRNAME"
DOTFILES_BACKUP_DIR="$HOME/.dotfiles_bak/$(date +"%Y_%m_%d")"

# list of directories to not be included in files for creating symbolic links
NOT_DOTDIRS=(
  .git
  .gitsecret
  scripts
  assets
)

# list of files to not be included in files for creating symbolic links
NOT_DOTFILES=(
  .DS_Store
  README.md
  Makefile
)

FIND_DIRS_COMMAND="fd -t d -H . $DOTFILES_DIR"
FIND_FILES_COMMAND="fd -t f -H . $DOTFILES_DIR"

for NOT_DOTDIR in "${NOT_DOTDIRS[@]}"; do
  FIND_DIRS_COMMAND+=" -E $NOT_DOTDIR"
  FIND_FILES_COMMAND+=" -E $NOT_DOTDIR"
done

for NOT_DOTFILE in "${NOT_DOTFILES[@]}"; do
  FIND_FILES_COMMAND+=" -E $NOT_DOTFILE"
done

mapfile -t DIRS < <(eval "$FIND_DIRS_COMMAND")
mapfile -t FILES < <(eval "$FIND_FILES_COMMAND")

extract_file_path() {
  echo -n "$1" | sed "s|$HOME/.dotfiles/||"
}

# mkdir for creating symbolic links
for DIR in "${DIRS[@]}"; do
  DIR=$(extract_file_path "$DIR")
  echo creating directory "$DIR"...
  mkdir -p "$HOME/$DIR"
done

# backup files and create symbolic links
for FILE in "${FILES[@]}"; do
  FILE=$(extract_file_path "$FILE")
  if [[ -f "$HOME/$FILE" ]] && [[ ! -L "$HOME/$FILE" ]]; then
    # create .dotfiles_backup in homedir
    mkdir -p "$DOTFILES_BACKUP_DIR"
    echo moving existing files to backup:
    mv "$HOME/$FILE" "$DOTFILES_BACKUP_DIR"
  fi
  echo creating symlink:
  ln -sfnv "$DOTFILES_DIR/$FILE" "$HOME/$FILE"
done

# other symlinks
"$HOME/.dotscripts/tasks/vs_code_coc_snippets_symlink.sh"
