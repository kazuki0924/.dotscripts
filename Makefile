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

all: setup

symlink:
> @ ./tasks/symlink.sh
> @ ./tasks/symlink.sh .nvimfiles .config/nvim
> @ ./tasks/symlink.sh .zshfiles .config/zsh
> @ ./tasks/vs_code_coc_snippets_symlink.sh
> @ ./tasks/purge_dead_symlinks.sh

.PHONY: symlink

setup: symlink

.PHONY: setup
