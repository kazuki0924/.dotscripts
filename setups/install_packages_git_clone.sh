#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# dircolors-solorized
[[ ! -d ~/.oss/dircolors-solarized ]] && git clone https://github.com/seebi/dircolors-solarized ~/.oss/dircolors-solarized

# LTFinderButtons
[[ ! -d ~/.oss/LTFinderButtons ]] && git clone https://github.com/lexrus/LTFinderButtons ~/.oss/LTFinderButtons
