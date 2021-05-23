#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# install rust / rustup / cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
