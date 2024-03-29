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

all: setup clone .symlink symlink

setup:
> @ ./setups/setup_mac_init.sh

.PHONY: setup

clone:
> @ git -C ~/.dotscripts pull
> @ [[ ! -d ~/.dotfiles ]] && git clone https://github.com/kazuki0924/.dotfiles ~/.dotfiles
> @ git -C ~/.dotfiles pull
> @ [[ ! -d ~/.zshfiles ]] && git clone https://github.com/kazuki0924/.zshfiles ~/.zshfiles
> @ git -C ~/.zshfiles pull
> @ [[ ! -d ~/.nvimfiles ]] && git clone https://github.com/kazuki0924/.nvimfiles ~/.nvimfiles
> @ git -C ~/.nvimfiles pull
> @ [[ ! -d ~/.golandfiles ]] && git clone https://github.com/kazuki0924/.golandfiles ~/.golandfiles
> @ git -C ~/.golandfiles pull
> @ [[ ! -d ~/.vscodefiles ]] && git clone https://github.com/kazuki0924/.vscodefiles ~/.vscodefiles
> @ git -C ~/.vscodefiles pull

.PHONY: clone

.symlink:
> @ cp ~/.dotscripts/tasks/.symlink.sh /usr/local/bin/.symlink

.PHONY: .symlink

symlink:
> @ ./tasks/purge_dead_symlinks.sh
> @ cd ~/.dotfiles && make symlink && cd -
> @ cd ~/.zshfiles && make symlink && cd -
> @ cd ~/.nvimfiles && make symlink && cd -
> @ cd ~/.golandfiles && make symlink && cd -
> @ cd ~/.vscodefiles && make symlink && cd -

.PHONY: symlink

brew/prerequisites:
> @ brew install make bash trash-cli fd tmux tmuxinator

.PHONY brew/prerequisites:
