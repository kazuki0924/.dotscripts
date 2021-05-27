#!/usr/local/bin/bash

# Golang: 
# - install with goenv interactively
# - install packages with go get

REQUIREMENTS=(
  goenv
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

brew upgrade goenv --fetch-HEAD

# goenv
echo Choose which version of go to install globally
# fuzzy find versions filtering out only the numbered ones in reverse order
VERSION=$(goenv install --list | awk '$0 !~ /[a-z]/' | sort -rn -k 2 -t "." | fzf --layout=reverse --height=20%)
goenv install "$VERSION"
goenv global "$VERSION"

echo ""
echo goenv versions

goenv versions

# install w/ go get
env GO111MODULE=on >/dev/null 2>&1

echo ""
echo installing go packages...

# slit
# https://github.com/tigrawap/slit
go get -u github.com/tigrawap/slit/cmd/slit

# pistol
# https://github.com/doronbehar/pistol
go get -u github.com/doronbehar/pistol/cmd/pistol
