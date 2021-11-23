#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# lua: 
# - install packages with luarocks

REQUIREMENTS=(
  lua
  luarocks
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

echo ""
echo installing with luarocks...
echo ""

# argparse
# https://github.com/mpeterv/argparse
luarocks install argparse

# luacheck
# https://github.com/mpeterv/luacheck
luarocks install luacheck

# lanes
# https://github.com/LuaLanes/lanes
luarocks install lanes

# lua-format
# https://github.com/Koihik/LuaFormatter
luarocks install --server=https://luarocks.org/dev luaformatter
