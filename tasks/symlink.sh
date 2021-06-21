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
HOME_DIRNAME="${2-$HOME}"
if [ ! "$HOME_DIRNAME" = "$HOME" ]; then
	HOME_DIRNAME="$HOME/$HOME_DIRNAME"
fi

DOTFILES_DIR="$HOME/$DOT_DIRNAME"
DOTFILES_BACKUP_DIR="$HOME/.dotfiles_bak/$(date +"%Y_%m_%d")"

# list of directories to not be included in files for creating symbolic links
NOT_DOTDIRS=(
	.git
	.gitsecret
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
	echo -n "$1" | sed "s|$HOME/$DOT_DIRNAME/||"
}

# mkdir for creating symbolic links
if [[ ! "$HOME_DIRNAME" = "$HOME" ]] && [[ ! -d "$HOME_DIRNAME" ]]; then
	echo creating directory "$HOME_DIRNAME"
	mkdir -p "$HOME_DIRNAME"
fi

for DIR in "${DIRS[@]}"; do
	DOT_DIR=$(extract_file_path "$DIR")
	HOME_DIR="$HOME_DIRNAME/$DOT_DIR"
	if [[ ! -d $HOME_DIR ]]; then
		echo creating directory "$DOT_DIR"...
		mkdir -p "$HOME_DIR"
	fi
done

# backup files and create symbolic links
for FILE in "${FILES[@]}"; do
	FILE=$(extract_file_path "$FILE")
	if [[ ! -L "$HOME_DIRNAME/$FILE" ]]; then
		if [[ -f "$HOME_DIRNAME/$FILE" ]]; then
			# create .dotfiles_backup in homedir
			mkdir -p "$DOTFILES_BACKUP_DIR"
			echo moving existing files to backup:
			echo "$HOME_DIRNAME/$FILE -> $DOTFILES_BACKUP_DIR"
			mv "$HOME_DIRNAME/$FILE" "$DOTFILES_BACKUP_DIR"
		fi
		echo creating symlink:
		ln -sfnv "$DOTFILES_DIR/$FILE" "$HOME_DIRNAME/$FILE"
	fi
done

