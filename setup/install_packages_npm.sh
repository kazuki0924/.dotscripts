#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# node.js: install packages with go npm i -g

# bash-language-server
# https://github.com/bash-lsp/bash-language-server
npm i -g bash-language-server

# strip-json-comments-cli
# https://github.com/sindresorhus/strip-json-comments-cli
npm i -g strip-json-comments-cli
