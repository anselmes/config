#!/usr/bin/env bash
# Dim hidden application in the Dock
defaults write com.apple.Dock showhidden -boolean true

# Minimize window into Dock
defaults write com.apple.dock minimize-to-application -bool true

# Show indicator light for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Automatically hide and show Dock
defaults write com.apple.dock autohide -bool true

# Restart Dock
killall Dock

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show path bar
defaults write com.apple.finder ShowPathBar -bool true

# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable warning when changing file extensions
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid crating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use column view by default in finder
# Other modes: `icnv`, `Nlsv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show ~/Library
chflags nohidden ~/Library

# Expand the following File Info panes:
# `General`, `More Info`, `Name & Extension`, `Comments`, `Open with`, `Preview` and `Sharing & Permissions`
defaults write come.apple.finder FXInfoPanesExpanded -dict\
  General -bool true\
  MoreInfo -bool true\
  Name -bool true\
  Comments -bool true\
  OpenWith -bool true\
  Preview -bool true\
  Permissions -bool true\

# Group windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool true

# Restart Finder
killall Finder

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Application Windows
defaults write com.apple.dock wvous-tr-corner -int 3
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Launchpad
defaults write com.apple.dock wvous-bl-corner -int 7
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → Start screen saver
defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0

# Prevents Safari from opening files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Configure XQuartz to accept network connections
# and not to open XTerm every time
defaults write org.macosforge.xquartz.X11 nolisten_tcp 0
defaults write org.macosforge.xquartz.X11 app_to_run /usr/bin/true
