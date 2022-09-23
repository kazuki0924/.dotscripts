#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# node.js: install packages with go npm i -g

# bash-language-server
# https://github.com/bash-lsp/bash-language-server
pnpm install --global bash-language-server

# strip-json-comments-cli
# https://github.com/sindresorhus/strip-json-comments-cli
pnpm install --global strip-json-comments-cli

# jsonlint
# https://github.com/prantlf/jsonlint
pnpm install --global @prantlf/jsonlint

# spectral
# https://github.com/stoplightio/spectral
pnpm install --global @stoplight/spectral-cli
