#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Chrome: add json files to automatically download the extensions

# Useful tools:
# Export links of all extensions
# https://chrome.google.com/webstore/detail/cmeckkgeamghjhkepejgjockldoblhcb

DIR="$HOME/.dotfiles/Library/Application Support/Google/Chrome/External Extensions/"

echo mkdir: created directory "$DIR"
mkdir -p "$DIR"

EXTENSIONS=(
	# Bitwarden - Free Password Manager
	https://chrome.google.com/webstore/detail/nngceckbapebfimnlniiiahkandclblb
  # Honey
  https://chrome.google.com/webstore/detail/bmnlcjabgnpnenekpadlanbbkooimhnj
  # Surfingkeys
  https://chrome.google.com/webstore/detail/gfbliohnnapiefjpjlpjnehglfpaknnc
  # Firenvim
  https://chrome.google.com/webstore/detail/egpjdkipkomnmjhjmdamaniclmdlobbo
	# Dark Reader
	https://chrome.google.com/webstore/detail/eimadpbcbfnmbkopoojfekhnkhdbieeh
  # OneTab
  https://chrome.google.com/webstore/detail/chphlpgkkbolifaimnlloiipkdnihall
  # The Great Suspender
  https://chrome.google.com/webstore/detail/jaekigmcljkkalnicnjoafgfjoefkpeg
  # New Tab Redirect
  https://chrome.google.com/webstore/detail/new-tab-redirect/icpgjfneehieebagbmdbhnlpiopdcmna
  # Google Translate
  https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb
	# DuckDuckGo Privacy Essentials
	https://chrome.google.com/webstore/detail/bkdgflcldnnnapblkhphbgpggdiikppg
	# Enhanced GitHub
	https://chrome.google.com/webstore/detail/anlikcnbgdeidpacdbdljnabclhahhmd
  # Refined GitHub
  https://chrome.google.com/webstore/detail/refined-github/hlepfoohegkhhmjieoechaddaejaokhf
  # OctoLinker
  https://chrome.google.com/webstore/detail/jlmafbaeoofdegohdhinkhilhclaklkp
	# Gitako - GitHub file tree
	https://chrome.google.com/webstore/detail/giljefjcheohhamkjphiebfjnlphnokk
	# GitHub File Icons
	https://chrome.google.com/webstore/detail/kkokonbjllgdmblmbichgkkikhlcnekp
  # Atom File Icons Web
  https://chrome.google.com/webstore/detail/atom-file-icons-web/pljfkbaipkidhmaljaaakibigbcmmpnc
	# Material DevTools Theme Collection
	https://chrome.google.com/webstore/detail/jmefikbdhgocdjeejjnnepgnfkkbpgjo
	# gruvbox theme
	https://chrome.google.com/webstore/detail/gruvbox-theme/ihennfdbghdiflogeancnalflhgmanop
  # JSONView
  https://chrome.google.com/webstore/detail/chklaanhfefbnpoihckbnefhakgolnmc
  # Export links of all extensions
  https://chrome.google.com/webstore/detail/export-links-of-all-exten/cmeckkgeamghjhkepejgjockldoblhcb
)

for EXTENSION in "${EXTENSIONS[@]}"; do
	FILENAME="$(echo "$EXTENSION" | awk -F "/" '{print $NF}')".json
	echo '{"external_update_url":"https://clients2.google.com/service/update2/crx"}' >"$DIR/$FILENAME"
	echo created "$FILENAME"
done
