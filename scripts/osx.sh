#!/usr/bin/env bash

DEFAULT_DESKTOP=$PROJECTS_DIR/dotfiles/.exclude/DesktopDefault.jpg

#################################################
### GENERAL
#################################################

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable OS X Gate Keeper for apps not in App Store
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable "Are you sure you want to open this application?" when opening app for first time
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable the "reopen windows" option on logout (checkbox will still appear checked)
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

### NOT WORKING WITH MOJAVE?
# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s "DEFAULT_DESKTOP" /System/Library/CoreServices/DefaultDesktop.jpg


#################################################
### SPOTLIGHT
#################################################

# Change indexing order and disable some file types
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}'
# Load new settings before rebuilding the index
killall mds > /dev/null 2>&1
# Make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null
# Rebuild the index from scratch
sudo mdutil -E / > /dev/null


#################################################
### DOCK
#################################################

# Set the icon size of Dock items to 36px
defaults write com.apple.dock tilesize -int 36

# Remove all pinned apps from Dock (finally)
defaults write com.apple.dock persistent-apps -array

# Set Dock to auto-hide and remove the auto-hiding delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Speed up Mission Control animations and group windows by application
defaults write com.apple.dock expose-animation-duration -float 0.1
#defaults write com.apple.dock "expose-group-by-app" -bool true


#################################################
### DISPLAY
#################################################

# Set interface style to Dark mode
defaults write -globalDomain "AppleInterfaceStyle" -string "Dark"

# Set default highlight color to green
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Enable HiDPI display modes (turn on Retina Mode on older Macs for screenshots, etc.)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# Speed up screen wake up time (screen standby now turns on at 24 hours, instead of 1)
# Source: http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# TODO: Find bash command to turn off floating thumbnail for screenshots (slows them down so much ughh)
#defaults write ...


#################################################
### FILESYSTEM
#################################################

### NOTE: Not working without booting up in hibernation mode (as of 2019-04-12)
# Remove sleepimage (saves a cpl gb), swap with a 0 byte file that the system can't overwrite
#sudo rm /Private/var/vm/sleepimage
#sudo touch /Private/var/vm/sleepimage
#sudo chflags uchg /Private/var/vm/sleepimage

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false


#################################################
### SCREENSHOTS
#################################################

# Set screenshots location to ~/Desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Disable screenshot drop shadow (no longer the default?)
defaults write com.apple.screencapture disable-shadow true


#################################################
### FINDER
#################################################

# Quit Finder with ⌘ + Q (also hides desktop icons)
defaults write com.apple.finder QuitMenuItem -bool true

# Show path bar (usually on by default)
defaults write com.apple.finder ShowPathbar -bool true

# Show full file path in Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Set Desktop to default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Show status bar in Finder by default (# of items, diskspace at bottom)
defaults write com.apple.finder ShowStatusBar -bool true

# Allow text selection in Quick Look (spacebar preview)
defaults write com.apple.finder QLEnableTextSelection -bool true

# Show all filename extensions in Finder by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files (have a bash alias called showit/hideit to toggle this)
defaults write com.apple.finder AppleShowAllFiles -bool TRUE && killall Finder

# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Set default view mode to column (all options: `Nlsv`, `icnv`, `clmv`, `Flwv`)
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"

# Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# When searching, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Don't make .DS_Store files on network volumes (speeds up indexing)
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Always show scrollbars (not just when scrolling)
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"


#################################################
### TRACKPAD
#################################################

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable tap to click at login screen too
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


#################################################
### KEYBOARD
#################################################

# Set key repeat to fastest level
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable press-and-hold (that modal pop-up with diff. characters)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set key repeat rate from 1 (fastest) to 300000 (slowest)
defaults write NSGlobalDomain KeyRepeat -int 10

# Set delay before repeat in milliseconds
defaults write NSGlobalDomain InitialKeyRepeat -int 10


#################################################
### BROWSERS
#################################################

# Chrome: Disable annoying backswipe navigation
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Safari: Enable Develop menu and the Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true


#################################################
### MISC
#################################################

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Messages: Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false


for app in Safari Finder Dock SystemUIServer; do
  killall "$app" >/dev/null 2>&1
done
