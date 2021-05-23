#!/usr/local/bin/bash
set -euo pipefail

# git: add user to git locally

# Requirements:
# git

echo local user.name:
read -r USER_NAME
echo local user.emal:
read -r USER_EMAL

git config --local user.name "$USER_NAME"
git config --local user.email "$USER_EMAL"
