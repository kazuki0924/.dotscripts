#!/usr/local/bin/bash

# Add json files for Chrome to automatically download the extensions

# Useful tools:
# Export links of all extensions
# https://chrome.google.com/webstore/detail/cmeckkgeamghjhkepejgjockldoblhcb

DIR="$HOME/.dotfiles/Library/Application Support/Google/Chrome/External Extensions/"

echo mkdir: created directory "$DIR"
mkdir -p "$DIR"
cd "$DIR"

EXTENSIONS=(
	# Bitwarden - Free Password Manager
	https://chrome.google.com/webstore/detail/nngceckbapebfimnlniiiahkandclblb
	# Dark Reader
	https://chrome.google.com/webstore/detail/eimadpbcbfnmbkopoojfekhnkhdbieeh
	# Dualless
	https://chrome.google.com/webstore/detail/bgdpkilkheacbboffppjgceiplijhfpd
	# DuckDuckGo Privacy Essentials
	https://chrome.google.com/webstore/detail/bkdgflcldnnnapblkhphbgpggdiikppg
	# Enhanced GitHub
	https://chrome.google.com/webstore/detail/anlikcnbgdeidpacdbdljnabclhahhmd
	# Export links of all extensions
	https://chrome.google.com/webstore/detail/cmeckkgeamghjhkepejgjockldoblhcb
	# Gitako - GitHub file tree
	https://chrome.google.com/webstore/detail/giljefjcheohhamkjphiebfjnlphnokk
	# GitHub File Icons
	https://chrome.google.com/webstore/detail/kkokonbjllgdmblmbichgkkikhlcnekp
	# Honey
	https://chrome.google.com/webstore/detail/bmnlcjabgnpnenekpadlanbbkooimhnj
	# Initab
	https://chrome.google.com/webstore/detail/igmbdimmfbpdplpahpapkploofmgaipl
	# JSONView
	https://chrome.google.com/webstore/detail/chklaanhfefbnpoihckbnefhakgolnmc
	# Material DevTools Theme Collection
	https://chrome.google.com/webstore/detail/jmefikbdhgocdjeejjnnepgnfkkbpgjo
	# OctoLinker
	https://chrome.google.com/webstore/detail/jlmafbaeoofdegohdhinkhilhclaklkp
	# OneTab
	https://chrome.google.com/webstore/detail/chphlpgkkbolifaimnlloiipkdnihall
	# Raindrop.io
	https://chrome.google.com/webstore/detail/ldgfbffkinooeloadekpmfoklnobpien
	# Surfingkeys
	https://chrome.google.com/webstore/detail/gfbliohnnapiefjpjlpjnehglfpaknnc
	# The Great Suspender
	https://chrome.google.com/webstore/detail/jaekigmcljkkalnicnjoafgfjoefkpeg
	# Firenvim
	https://chrome.google.com/webstore/detail/egpjdkipkomnmjhjmdamaniclmdlobbo
)

for EXTENSION in "${EXTENSIONS[@]}"; do
	FILENAME="$(echo "$EXTENSION" | awk -F "/" '{print $NF}')".json
	echo '{"external_update_url":"https://clients2.google.com/service/update2/crx"}' >"$FILENAME"
	echo created "$FILENAME"
done
