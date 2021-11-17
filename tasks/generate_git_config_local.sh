#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# git: add user to git locally

REQUIREMENTS=(
  git
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

echo local user.name:
read -r USER_NAME
echo local user.emal:
read -r USER_EMAL

git config --local user.name "$USER_NAME"
git config --local user.email "$USER_EMAL"
