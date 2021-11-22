#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# GitHub:
# - creates ssh keys if they don't exist
# - login
# - tests ssh connection

REQUIREMENTS=(
  gh
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

DIR="$HOME/.ssh"

[[ ! -d "$DIR" ]] && mkdir "$DIR"

[[ ! -f "$DIR/id_rsa" ]] && ssh-keygen -t rsa

gh auth login

ssh -T git@github.com
