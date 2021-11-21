#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# defaultbrowser: set default browser for MacOS

# Requirements:
# defaultbrowser fzf Chrome
# Optional:
# Brave FireFoxDeveloperEdition qutebrowser

REQUIREMENTS=(
	defaultbrowser
	fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
	which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

echo Choose which browser to be the default:

BROWSERS=(
	chrome
	brave
	safari
	firefoxdevelopereition
	qtwebenginecore
)

LIST=""
for BROWSER in "${BROWSERS[@]}"; do
	LIST+="$BROWSER""\n"
done

BROWSER="$(printf "%b" "$LIST" | fzf --layout=reverse --height=20%)"

if [[ $BROWSER = "brave" ]]; then
	# brave is listed as "browser" in the HTTP handler list
	BROWSER="browser"
fi

defaultbrowser "$BROWSER"
