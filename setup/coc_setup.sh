#!/usr/local/bin/bash

# install coc plugins

# Useful links:
# coc.nvim on npm
# - https://www.npmjs.com/search?q=keywords%3Acoc.nvim

mkdir -p ~/.config/coc/extensions
cd ~/.config/coc/extensions

if [ ! -f package.json ]; then
  echo '{"dependencies":{}}' >package.json
fi

PLUGINS=(
  # https://github.com/neoclide/coc-snippets
  coc-snippets
  # https://github.com/iamcco/coc-diagnostic
  coc-diagnostic
  # https://github.com/neoclide/coc-highlight
  coc-highlight
  # https://github.com/neoclide/coc-pairs
  coc-pairs
  # https://github.com/neoclide/coc-tsserver
  coc-tsserver
  # https://github.com/neoclide/coc-prettier
  coc-prettier
  # https://github.com/neoclide/coc-eslint
  coc-eslint
  # https://github.com/neoclide/coc-tabnine
  coc-tabnine
  # https://github.com/iamcco/coc-spell-checker
  coc-spell-checker
  # https://github.com/neoclide/coc-jest
  coc-jest
  # https://github.com/khanghoang/coc-jest
  coc-inline-jest
  # https://github.com/iamcco/coc-webpack
  coc-webpack
  # https://github.com/neoclide/coc-json
  coc-json
  # https://github.com/neoclide/coc-yaml
  coc-yaml
  # https://github.com/fannheyward/coc-xml
  coc-xml
  # https://github.com/kkiyama117/coc-toml
  coc-toml
  # https://github.com/neoclide/coc-git
  coc-git
  # https://github.com/iamcco/coc-gitignore
  coc-gitignore
  # https://github.com/neoclide/coc-emmet
  coc-emmet
  # https://github.com/josa42/coc-sh
  # coc-sh
  # https://github.com/josa42/coc-docker
  coc-docker
  # https://github.com/fannheyward/coc-sql
  coc-sql
  # https://github.com/fannheyward/coc-markdownlint
  coc-markdownlint
  # https://github.com/josa42/coc-lua
  coc-lua
  # https://github.com/neoclide/coc-html
  coc-vimlsp
  # https://github.com/iamcco/coc-vimlsp
  coc-html
  # https://github.com/neoclide/coc-css
  coc-css
  # https://github.com/iamcco/coc-tailwindcss
  coc-tailwindcss
  # https://www.npmjs.com/package/coc-stylelintplus
  coc-stylelintplus
  # https://github.com/antonk52/coc-protobuf
  coc-protobuf
  # https://github.com/ruanyl/coc-apollo
  coc-apollo
  # https://github.com/fannheyward/coc-marketplace
  coc-marketplace
)

npm i "${PLUGINS[@]}" --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
