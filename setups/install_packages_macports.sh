#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

sudo port selfupdate

# pgModeler
sudo port install pgmodeler
