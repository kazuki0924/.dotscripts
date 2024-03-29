#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# duti: set default document and URL handlers for MacOS

# Determine the bundle ID:
# mdls /Applications/iPhoto.app | grep kMDItemCF
# Determine the UTI:
# mdls file.ext | grep kMDItemContentType

# Delay start for a few seconds. If it runs too early, the change won't register.
sleep 5

REQUIREMENTS=(
	duti
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
	which "${REQUIREMENT}" &>/dev/null || brew install "${REQUIREMENT}"
done

EDITOR="com.microsoft.VSCodeInsiders"

TEXTS=(
  public.plain-text
  public.source-code
  public.data
  public.shell-script
  com.netscape.javascript-source
  .sh
  .zsh
  .zshrc
  .go
  .ts
  .tsx
  .js
  .jsx
  .css
  .scss
  .md
  .pdf
  .xml
  .cvs
  .json
  .yml
  .yaml
  .toml
  .sql
  .lua
  .vim
  .vimrc
  .rs
  Makefile
  Brewfile
)

for TEXT in "${TEXTS[@]}"; do
  echo "Setting ${TEXT} to be opened by ${EDITOR} by default"
  duti -s "${EDITOR}" "${TEXT}" all
done
