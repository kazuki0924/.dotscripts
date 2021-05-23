SHELL := bash
.ONESHELL:
.DELETE_ON_ERROR:
.SHELLFLAGS := -euo pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

# .PHONY: setup symlink fonts mac install homebrew npm_install_g curl

# all: setup install

# setup: symlink fonts mac 

# symlink:
# 	./scripts/symlink.sh

# fonts:
# 	./scripts/fonts.sh

# mac:
# 	./scripts/mac.sh

# install: homebrew npm_install_g curl 

# homebrew:
# 	./scripts/homebrew.sh

# npm_install_g :
# 	./scripts/npm_install_g.sh

# curl:
# 	./scripts/curl.sh

test:
> @ ./test.sh

shfiles  := $(wildcard **/*.sh)

echo:
> @ echo "$(shfiles)"
