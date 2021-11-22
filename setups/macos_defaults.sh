#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# https://git.herrbischoff.com/awesome-macos-command-line/about/
# https://github.com/ulwlu/dotfiles/blob/master/system/macos.sh

# sudo in advance
sudo -v
while true; do
  sudo -n true
  sleep 10
  kill -0 "$$" || exit
done 2>/dev/null &

# ---------- Sleep ----------
# put display to sleep after n minutes of inactivity
sudo pmset displaysleep 45

# set system sleep idle time to n minutes
systemsetup -setcomputersleep 90 >/dev/null 2>&1

# ---------- Turn Off Mac’s Startup Sound ----------
sudo nvram SystemAudioVolume=%00

# ---------- Remove Proxy Icon Hover Delay ----------

# Disable
defaults write -g NSToolbarTitleViewRolloverDelay -float 0

# Enable (Default)
# defaults delete -g NSToolbarTitleViewRolloverDelay

# ---------- Subpixel Anti-Aliasing (Font Smoothing) ----------


# Enable
defaults write -g CGFontRenderingFontSmoothingDisabled -bool false

# Disable (Default)
# defaults write -g CGFontRenderingFontSmoothingDisabled -bool true

# ---------- Transparency in Menu and Windows ----------

# Reduce Transparency
# defaults write com.apple.universalaccess reduceTransparency -bool true

# Restore Default Transparency
defaults write com.apple.universalaccess reduceTransparency -bool false

# ---------- Show Hidden App Icons ----------

# Enable
defaults write com.apple.dock showhidden -bool true

# Disable (Default)
# defaults write com.apple.dock showhidden -bool false && \
# killall Dock

# ---------- Show Hidden Files ----------

# Show All
defaults write com.apple.finder AppleShowAllFiles true

# Restore Default File Visibility
# defaults write com.apple.finder AppleShowAllFiles false

# ---------- Finder ----------

# show full path in finder title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# show "quit finder" menu item

# Enable
defaults write com.apple.finder QuitMenuItem -bool true

# Disable (Default)
# defaults write com.apple.finder QuitMenuItem -bool false

# ----------  Expand Save Panel by Default ----------
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

### Path Bar

# Show
defaults write com.apple.finder ShowPathbar -bool true

# Hide (Default)
# defaults write com.apple.finder ShowPathbar -bool false

### Save to Disk by Default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

### Disable Creation of Metadata Files on Network Volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

### Disable Creation of Metadata Files on USB Volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

### Chime When Charging

# Enable (Default)
# defaults write com.apple.PowerChime ChimeOnNoHardware -bool false && \
# open /System/Library/CoreServices/PowerChime.app

# Disable
defaults write com.apple.PowerChime ChimeOnNoHardware -bool true

### Keyboard Auto-Correct

# Disable
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Enable (Default)
# defaults write -g NSAutomaticSpellingCorrectionEnabled -bool true

### Full Keyboard Access

# Text boxes and lists only (Default)
# defaults write NSGlobalDomain AppleKeyboardUIMode -int 0

# All controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

### Key Repeat

# Enable
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable (Default)
# defaults write -g ApplePressAndHoldEnabled -bool true

### Set Software Update Check Interval
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# ========== Apprerance ==========
# - Light
# defaults delete .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1
# defaults delete .GlobalPreferences AppleInterfaceStyle > /dev/null 2>&1
# - Dark
defaults delete .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically >/dev/null 2>&1
defaults write .GlobalPreferences AppleInterfaceStyle -string "Dark"
# - Auto
# defaults write .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically -bool true

# ========== Accent color ==========
# - Blue
defaults delete .GlobalPreferences AppleAccentColor >/dev/null 2>&1
# - Purple
# defaults write .GlobalPreferences AppleAccentColor -int 5
# - Pink
# defaults write .GlobalPreferences AppleAccentColor -int 6
# - Red
# defaults write .GlobalPreferences AppleAccentColor -int 0
# - Orange
# defaults write .GlobalPreferences AppleAccentColor -int 1
# - Yellow
# defaults write .GlobalPreferences AppleAccentColor -int 2
# - Green
# defaults write .GlobalPreferences AppleAccentColor -int 3
# - Grphite
# defaults write .GlobalPreferences AppleAccentColor -string "-1"

# ========== Highlight color ==========
# - Blue
defaults delete .GlobalPreferences AppleHighlightColor >/dev/null 2>&1
# - Purple
# defaults write .GlobalPreferences AppleHighlightColor -string "0.968627 0.831373 1.000000 Purple"
# - Pink
# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.749020 0.823529 Pink"
# - Red
# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.733333 0.721569 Red"
# - Orange
# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.874510 0.701961 Orange"
# - Yellow
# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.937255 0.690196 Yellow"
# - Green
# defaults write .GlobalPreferences AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"
# - Grphite
# defaults write .GlobalPreferences AppleHighlightColor -string "0.847059 0.847059 0.862745 Graphite"
# - Other
# defaults write .GlobalPreferences AppleHighlightColor -string "Your NSColor"

# ========== Sidebar icon size ==========
# - Small
defaults write .GlobalPreferences NSTableViewDefaultSizeMode -int 1
# - Medium
# defaults write .GlobalPreferences NSTableViewDefaultSizeMode -int 2
# - Large
# defaults write .GlobalPreferences NSTableViewDefaultSizeMode -int 3

# ========== Automatically hide and show the menu bar ==========
# - Checked
# defaults write .GlobalPreferences _HIHideMenuBar -bool true
# - Unchecked
defaults write .GlobalPreferences _HIHideMenuBar -bool false

# ========== Show scroll bars ==========
# - Automatically based on mouse or trackpad
defaults write .GlobalPreferences AppleShowScrollBars -string "Automatic"
# - When scrolling
# defaults write .GlobalPreferences AppleShowScrollBars -string "WhenScrolling"
# - Always
# defaults write .GlobalPreferences AppleShowScrollBars -string "Always"

# ========== Click in the scroll bar to ==========
# - Jump to the next page
# defaults write .GlobalPreferences AppleScrollerPagingBehavior -bool false
# - Jump to the spot that's clicked
defaults write .GlobalPreferences AppleScrollerPagingBehavior -bool true

# ========== Ask to keep changes when closing documents ==========
# - Checked
# defaults write .GlobalPreferences NSCloseAlwaysConfirmsChanges -bool true
# - Unchecked
defaults write .GlobalPreferences NSCloseAlwaysConfirmsChanges -bool false

# ========== Close windows when quitting an app ==========
# - Checked
# defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool false
# - Unchecked
defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool true

# ========== Allow Handoff between this Mac and your iCloud devices ==========
# - Checked
# defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool true
# defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool true
# - Unchecked
defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool false
defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool false

# ========== ScreenSaver Start After ==========
# @int: seconds
defaults -currentHost write com.apple.screensaver idleTime -int 0

# ========== ScreenSaver Show with clock ==========
# - Checked
# defaults -currentHost write com.apple.screensaver showClock -bool true
# - Unchecked
defaults -currentHost delete com.apple.screensaver showClock

# ========== Size ==========
# @int: size
defaults write com.apple.dock tilesize -int 20

# ========== Magnification ==========
# - Checked
# defaults write com.apple.dock magnification -bool true
# - Unchecked
defaults delete com.apple.dock magnification

# ========== `Magnification` Bar ==========
# @int: size
# defaults write com.apple.dock largesize -int 128

# ========== Position on screen ==========
# - Left
# defaults write com.apple.dock orientation -string "left"
# - Bottom
defaults delete com.apple.dock orientation
# - Right
# defaults write com.apple.dock orientation -string "right"

# ========== Minimize windows using ==========
# - Genie effect
defaults write com.apple.dock mineffect -string "genie"
# - Scale effect
# defaults write com.apple.dock mineffect -string "scale"

# ========== Prefer tabs when opening documents ==========
# - Always
defaults write .GlobalPreferences AppleWindowTabbingMode -string "always"
# - In Full Screen nly
# defaults write .GlobalPreferences AppleWindowTabbingMode -string "fullscreen"
# - Manually
# defaults write .GlobalPreferences AppleWindowTabbingMode -string "manual"

# ========== Double-click a window's title bar to ==========
# - Checked
# `Double-click a window's title bar to` pop up menu
#  - minimize
# defaults write .GlobalPreferences AppleActionOnDoubleClick -string "Minimize"
#  - zoom
defaults write .GlobalPreferences AppleActionOnDoubleClick -string "Maximize"
# - Unchecked
# defaults write .GlobalPreferences AppleActionOnDoubleClick -string "None"

# ========== Minimize windows into application icon ==========
# - Checked
defaults write com.apple.dock minimize-to-application -bool true
# - Unchecked
# defaults write com.apple.dock minimize-to-application -bool false

# ========== Animate opening applications ==========
# - Checked
# defaults write com.apple.dock launchanim -bool true
# - Unchecked
defaults write com.apple.dock launchanim -bool false

# ========== Automatically hide and show the Dock ==========
# - Checked
defaults write com.apple.dock autohide -bool true
# - Unchecked
# defaults delete com.apple.dock autohide

# ========== Show indicators for open applications ==========
# - Checked
defaults write com.apple.dock show-process-indicators -bool true
# - Unchecked
# defaults write com.apple.dock show-process-indicators -bool false

# ========== Show recent applications in Dock ==========
# - Checked
# defaults write com.apple.dock show-recents -bool true
# - Unchecked
defaults write com.apple.dock show-recents -bool false

# ========== Automatically rearrange Spaces based on most recent use ==========
# - Checked
# defaults write com.apple.dock mru-spaces -bool true
# - Unchecked
defaults write com.apple.dock mru-spaces -bool false

# ========== When switching to an application, switch to a Space with open windows for the application ==========
# - Checked
defaults write .GlobalPreferences AppleSpacesSwitchOnActivate -bool true
# - Unchecked
# defaults write .GlobalPreferences AppleSpacesSwitchOnActivate -bool false

# ========== Group windows by application ==========
# - Checked
defaults write com.apple.dock expose-group-apps -bool true
# - Unchecked
# defaults write com.apple.dock expose-group-apps -bool false

# ========== Displays have separate Spaces ==========
# - Checked
defaults write com.apple.spaces spans-displays -bool true
# - Unchecked
# defaults write com.apple.spaces spans-displays -bool false

# ========== Dashboard ==========
# - Off
defaults write com.apple.dashboard db-enabled-state -int 1
# - As Space
# defaults write com.apple.dashboard db-enabled-state -int 2
# - As Overlay
# defaults write com.apple.dashboard db-enabled-state -int 3

# ========== Enable Ask Siri ==========
# - Checked
# defaults write com.apple.assistant.support.plist Assistant Enabled -bool true
# - Unchecked
defaults write com.apple.assistant.support.plist "Assistant Enabled" -bool false

# ========== Show Siri in menu bar ==========
# - Checked
# defaults write com.apple.Siri StatusMenuVisible -bool true
# - Unchecked
defaults write com.apple.Siri StatusMenuVisible -bool false

# ========== Allow Spotlight Suggestions in Look up ==========
# - Checked
defaults write com.apple.lookup.shared LookupSuggestionsDisabled -bool true
# - Unchecked
# defaults write com.apple.lookup.shared LookupSuggestionsDisabled -bool false

# ========== Display Spotlight in menu bar ==========
# - Checked
# defaults write ~/Library/Preferences/ByHost/com.apple.Spotlight MenuItemHidden -bool true
# - Unchecked
defaults write ~/Library/Preferences/ByHost/com.apple.Spotlight MenuItemHidden -bool false

# ========== Require password ~ after sleep or screen saver begins ==========
# - Checked
# @int: seconds
# defaults write com.apple.screensaver askForPassword -bool true
# defaults write com.apple.screensaver askForPasswordDelay -int 0
# - Unchecked
defaults write com.apple.screensaver askForPassword -bool false

# ========== Show Wi-Fi status in menu bar ==========
# - Checked
defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist WiFi -int 18
# - Unchecked
# defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool false
# defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist WiFi -int 24

# ========== Show Bluetooth status in menu bar ==========
# - Checked
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
# - Unchecked
# defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool false
# defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 24

# ========== Show Volume status in menu bar ==========
# - Checked
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 18
# - Unchecked
# defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool false
# defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 24

# ========== Show Battery status in menu bar ==========
# - Checked
defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Battery -int 18
# - Unchecked
# defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool false
# defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Battery -int 24

# ========== Show Battery percentage in menu bar ==========
# - Show
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool true
# - Hide
# defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool false

# ========== Set date and time automatically ==========
# - Checked
systemsetup -setusingnetworktime on >/dev/null
# - Unchecked
# sudo systemsetup -setusingnetworktime off > /dev/null

# ========== Time options ==========
# - Digital
defaults write com.apple.menuextra.clock IsAnalog -bool false
# - Analog
# defaults write com.apple.menuextra.clock IsAnalog -bool true

# ========== Display the time with seconds ==========
# - Checked
defaults write com.apple.menuextra.clock ShowSeconds -bool true
# - Unchecked
# defaults write com.apple.menuextra.clock ShowSeconds -bool false

# ========== Flash the time separators ==========
# - Checked
# defaults write com.apple.menuextra.clock FlashDateSeparators -bool true
# - Unchecked
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

# ========== Use a 24-hour clock ==========
# - Checked
defaults write com.apple.menuextra.clock Show24Hour -bool true
# - Unchecked
# defaults write com.apple.menuextra.clock Show24Hour -bool false

# ========== Show AM/PM ==========
# - Checked
# defaults write com.apple.menuextra.clock ShowAMPM -bool true
# - Unchecked
defaults write com.apple.menuextra.clock ShowAMPM -bool false

# ========== Show the day of the week ==========
# - Checked
# defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true
# - Unchecked
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool false

# ========== Show date (In BigSur, time always appears) ==========
# - Checked
defaults write com.apple.menuextra.clock ShowDayOfMonth -bool true
# - Unchecked
# defaults write com.apple.menuextra.clock ShowDayOfMonth -bool false

# iCloud - Disable All settings
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# ========== Key Repeat ==========
# @int: 15 is the fastest in GUI, but real is 10
defaults write .GlobalPreferences InitialKeyRepeat -int 15

# ========== Delay Until Repeat ==========
# @int: 2 is the fastest in GUI, but real is 1
defaults write .GlobalPreferences KeyRepeat -int 2

# ========== Adjust keyboard brightness in low light ==========
NPLIST="/private/var/root/Library/Preferences/com.apple.CoreBrightness.plist"
CurrentUUID=$(dscl . -read /Users/$(whoami)/ GeneratedUID | cut -d' ' -f2)
CurrentUUID="CBUser-${CurrentUUID}"
# - Checked
# sudo /usr/libexec/PlistBuddy -c "Set :KeyboardBacklight:KeyboardBacklightABEnabled 1" ${NPLIST}
# - Unchecked
/usr/libexec/PlistBuddy -c "Set :KeyboardBacklight:KeyboardBacklightABEnabled 0" ${NPLIST}

# ========== Turn keyboard backlight off after ~~~ of inactivity ==========
# @int:second
/usr/libexec/PlistBuddy -c "Set :KeyboardBacklight:KeyboardBacklightIdleDimTime 0" ${NPLIST}

# ========== Show keyboard and emoji viewers in menu bar ==========
PLIST="${HOME}/Library/Preferences/com.apple.HIToolbox.plist"
IS_EMOJI=$(/usr/libexec/PlistBuddy -c "Print AppleEnabledInputSources" "${PLIST}" | grep 'com.apple.CharacterPaletteIM')
HNUM=$(/usr/libexec/PlistBuddy -c "Print AppleEnabledInputSources" "${PLIST}" | ggrep -cP '^[\s]*Dict')
# - Checked
if [[ -z ${IS_EMOJI} ]]; then
	/usr/libexec/PlistBuddy \
		-c "Add AppleEnabledInputSources:${HNUM} dict" \
		-c "Add AppleEnabledInputSources:${HNUM}:InputSourceKind string \"Non Keyboard Input Method\"" \
		-c "Add AppleEnabledInputSources:${HNUM}:\"Bundle ID\" string \"com.apple.CharacterPaletteIM\"" \
		"${PLIST}"
fi
# - Unchecked
if [[ -n ${IS_EMOJI} ]]; then
	for idx in $(seq 0 $(expr "${HNUM}" - 1)); do
		BUNDLE_ID=$(/usr/libexec/PlistBuddy -c "Print AppleEnabledInputSources:${idx}:\"Bundle ID\"" "${PLIST}" 2>/dev/null)
		if [[ $BUNDLE_ID == "com.apple.CharacterPaletteIM" ]]; then
			/usr/libexec/PlistBuddy -c "Delete AppleEnabledInputSources:${idx}" "${PLIST}"
		fi
	done
fi

# ========== Correct spelling automatically ==========
# - Checked
# defaults write .GlobalPreferences WebAutomaticSpellingCorrectionEnabled -bool true
# defaults write .GlobalPreferences NSAutomaticSpellingCorrectionEnabled -bool true
# - Unchecked
defaults write .GlobalPreferences WebAutomaticSpellingCorrectionEnabled -bool false
defaults write .GlobalPreferences NSAutomaticSpellingCorrectionEnabled -bool false

# ========== Capitalize words automatically ==========
# - Checked
# defaults write .GlobalPreferences NSAutomaticCapitalizationEnabled -bool true
# - Unchecked
defaults write .GlobalPreferences NSAutomaticCapitalizationEnabled -bool false

# ========== Add period with double-space ==========
# - Checked
# defaults write .GlobalPreferences NSAutomaticPeriodSubstitutionEnabled -bool true
# - Unchecked
defaults write .GlobalPreferences NSAutomaticPeriodSubstitutionEnabled -bool false

# ========== Use smart quotes and dashes ==========
# - Checked
# defaults write .GlobalPreferences NSAutomaticDashSubstitutionEnabled -bool true
# defaults write .GlobalPreferences NSAutomaticQuoteSubstitutionEnabled -bool true
# - Unchecked
defaults write .GlobalPreferences NSAutomaticDashSubstitutionEnabled -bool false
defaults write .GlobalPreferences NSAutomaticQuoteSubstitutionEnabled -bool false

# ========== Show Input menu in menu bar ==========
# - Checked
defaults write com.apple.TextInputMenu visible -bool true
# - Unchecked
# defaults write com.apple.TextInputMenu visible -bool false

# Trackpad
# ========== Look up & data detectors ==========
# - Checked
#  - Force Click with one finger
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 1
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 1
#  - Tap with Three fingers
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2
# - Unchecked
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 0

# ========== Secondary click ==========
# - Checked
#  - Click or tap with two fingers
defaults write .GlobalPreferences ContextMenuGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
#  - Click in bottom right corner
# defaults write .GlobalPreferences ContextMenuGesture -int 1
# defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool false
# defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
#  - Click in bottom left corner
# defaults write .GlobalPreferences ContextMenuGesture -int 1
# defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool false
# defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 1
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 1
# - Unchecked
# defaults write .GlobalPreferences ContextMenuGesture -int 0
# defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool false
# defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0

# ========== Tap to click ==========
# - Checked
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# - Unchecked
# defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# ========== Click ==========
# @int:Light.0 Medium.1 Firm.2
defaults write -g com.apple.trackpad.forceClick 2

# ========== Tracking speed ==========
# @int:Slow.0 Fast.3
defaults write -g com.apple.trackpad.scaling 3

# ========== Silent Click ( deprecated? ) ==========
# - Checked
# defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ActuationStrength -int 0
# - Unchecked
# defaults delete com.apple.AppleMultitouchTrackpad ActuationStrength
# defaults delete com.apple.driver.AppleBluetoothMultitouch.trackpad ActuationStrength

# ========== Force Click and haptic feedback ==========
# - Checked
# defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool true
# defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ActuateDetents -bool true
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ForceSuppressed -bool false
# - Unchecked
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool false
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ActuateDetents -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ForceSuppressed -bool true

# ========== Scroll direction: Natural ==========
# - Checked
defaults write .GlobalPreferences com.apple.swipescrolldirection -bool true
# - Unchecked
# defaults write .GlobalPreferences com.apple.swipescrolldirection -bool false

# ========== Zoom in or out ==========
# - Checked
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true
# - Unchecked
# defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool false

# ========== Smart zoom ==========
# - Checked
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool true
# - Unchecked
# defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool false

# ========== Rotate ==========
# - Checked
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool true
# - Unchecked
# defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool false

# ========== Swipe between pages ==========
# - Checked
#  - Scroll left or right with two fingers
defaults write .GlobalPreferences AppleEnableSwipeNavigateWithScrolls -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write ~/Library/Preferences/ByHost/.GlobalPreferences com.apple.trackpad.threeFingerHorizSwipeGesture -int 0
#  - Swipe with three fingers
# defaults write .GlobalPreferences AppleEnableSwipeNavigateWithScrolls -bool true
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 1
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1
# defaults write ~/Library/Preferences/ByHost/.GlobalPreferences com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
#  - Swipe with two or three fingers
# defaults write .GlobalPreferences AppleEnableSwipeNavigateWithScrolls -bool false
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 1
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1
# defaults write ~/Library/Preferences/ByHost/.GlobalPreferences com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
# - Unchecked
# defaults write .GlobalPreferences AppleEnableSwipeNavigateWithScrolls -bool false
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
# defaults write ~/Library/Preferences/ByHost/.GlobalPreferences com.apple.trackpad.threeFingerHorizSwipeGesture -int 1

# ========== Swipe between full-screen apps ==========
# - Checked
#  - Scroll left or right with three fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2
#   - Scroll left or right with four fingers
# defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
# - Unchecked
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
# defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 0
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 0

# ========== Notification Center ==========
# - Checked
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3
# - Unchecked
# defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0

# ========== Mission Control ==========
# - Checked
#  - Swipe up with three fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
#   - Swipe up with four fingers
# defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
# - Unchecked
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
# defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 0
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 0

# ========== App Expose ==========
# - Checked
#  - Swipe down with three fingers
# defaults write com.apple.dock showAppExposeGestureEnabled -bool true
# defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
#   - Swipe down with four fingers
# defaults write com.apple.dock showAppExposeGestureEnabled -bool true
# defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
# - Unchecked
defaults write com.apple.dock showAppExposeGestureEnabled -bool false

# ========== Launchpad ==========
# - Checked
defaults write com.apple.dock showLaunchpadGestureEnabled -bool true
# - Unchecked
# defaults write com.apple.dock showLaunchpadGestureEnabled -bool false

# ========== Show Desktop ==========
# - Checked
defaults write com.apple.dock showDesktopGestureEnabled -bool true
# - Unchecked
# defaults write com.apple.dock showDesktopGestureEnabled -bool false

# Finder
# ========== Show all filename extensions ==========
# - Checked
defaults write -g AppleShowAllExtensions -bool true
# - Unchecked
# defaults write -g AppleShowAllExtensions -bool false

# ========== Show warning before changing an extension ==========
# - Checked
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true
# - Unchecked
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# ========== Show warning before removing from iCloud Drive ==========
# - Checked
# defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool true
# - Unchecked
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# ========== Show warning before emptying the Trash ==========
# - Checked
# defaults write com.apple.finder WarnOnEmptyTrash -bool true
# - Unchecked
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# ========== Remove items from the Trash after 30 days ==========
# - Checked
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
# - Unchecked
# defaults write com.apple.finder FXRemoveOldTrashItems -bool false

# ========== View ==========
# - as Icons
# defaults write com.apple.Finder FXPreferredViewStyle -string icnv
# - as Columns
defaults write com.apple.Finder FXPreferredViewStyle -string Nlsv
# - as Gallary View
# defaults write com.apple.Finder FXPreferredViewStyle -string clmv
# - as List
# defaults write com.apple.Finder FXPreferredViewStyle -string Flwv

# ========== Icon Size ==========
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 36" "${HOME}"/Library/Preferences/com.apple.finder.plist

# ========== Text Size ==========
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" "${HOME}"/Library/Preferences/com.apple.finder.plist

# ========== Show Toolbar ==========
# - Checked
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowPreviewPane -bool true
# - Unchecked
# defaults write com.apple.finder ShowSidebar -bool false
# defaults write com.apple.finder ShowPreviewPane -bool false

# ========== Show Path Bar ==========
# - Checked
defaults write com.apple.finder ShowPathbar -bool true
# - Unchecked
# defaults write com.apple.finder ShowPathbar -bool false

# ========== Show Tab Bar ==========
# - Checked
defaults write com.apple.finder ShowTabView -bool true
# - Unchecked
# defaults write com.apple.finder ShowTabView -bool false

# ========== Show Status Bar ==========
# - Checked
defaults write com.apple.finder ShowStatusBar -bool true
# - Unchecked
# defaults write com.apple.finder ShowStatusBar -bool false

# AppStore

# ========== Auto Update Check ==========
# - Enable
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# - Disable
# defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false

# ========== Auto Update ==========
# - Enable
# defaults write com.apple.commerce AutoUpdate -bool true
# - Disable
defaults write com.apple.commerce AutoUpdate -bool false

# ========== Set Screenshot saved directory ==========
# - Default
# defaults write com.apple.screencapture location -string "$HOME/Desktop"
# - Custom
defaults write com.apple.screencapture location -string "$HOME/Screenshots"

# ========== Set Screenshots format ==========
# - png
defaults write com.apple.screencapture type -string "png"
# - jpg
# defaults write com.apple.screencapture type -string "jpg"
# - bmp
# defaults write com.apple.screencapture type -string "bmp"

# ========== Disable shadow of screenshot ==========
# - Disable
defaults write com.apple.screencapture disable-shadow -bool true
# - Default
# defaults write com.apple.screencapture disable-shadow -bool false

# ========== Rename screenshot default name ==========
# - Default
# defaults delete com.apple.screencapture name
# - Custom
defaults write com.apple.screencapture name -string "ss"

# ========== Remove timestamp ==========
# - Remove
defaults write com.apple.screencapture include-date -bool false
# - Default
# defaults write com.apple.screencapture include-date -bool true

# ========== Show Directory Details ==========
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# ========== Crash Reporter to be in Notification but Popup Window ==========
defaults write com.apple.CrashReporter UseUNC 1

# ========== Speed up Window Resize Animation ==========
defaults write -g NSWindowResizeTime -float 0.001

# ========== Disable Animation in Finder ==========
defaults write com.apple.finder DisableAllAnimations -bool true

# ========== Dock Start Appearance time ==========
# - default
# defaults delete com.apple.dock autohide-delay
# @int/float: seconds
defaults write com.apple.dock autohide-delay -float 1000

# ========== Dock Appearance Animation time ==========
# - default
# defaults delete com.apple.dock autohide-time-modifier
# @int/float: seconds
defaults write com.apple.dock autohide-time-modifier -float 0

# ========== Dock Icon Bouncing ==========
# - default
# defaults delete com.apple.dock no-bouncing
# - No Bounce
defaults write com.apple.dock no-bouncing -bool TRUE

# Apply changes immediately
killall SystemUIServer
killall Dock
killall Finder
killall PowerChime
