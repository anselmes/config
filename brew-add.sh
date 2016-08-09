#!/usr/bin/env bash

# Bash Completion
brew install \
  apm-bash-completion \
  bash-completion \
  brew-cask-completion \
  launchctl-completion \
  open-completion \
  pip-completion \
#  gem-completion \
#  ruby-completion \
#  ruby-completion

# Cask apps
brew cask install \
  anylist \
  appcleaner \
  atom \
  batchmod \
  dropbox \
  firefox \
  flux \
  gitkraken \
  google-drive \
  hirundo \
  hosts \
  kitematic \
  kodi \
  megasync \
  pgadmin3 \
  robomongo \
  sequel-pro \
  skype \
  teamviewer \
  tranmission \
  vlc \
  vmware-fusion \
  wireshark \
  wwdc

# Brew Cask
brew cask update
brew cask cleanup

# Remove outdated versions from the cellar
brew update
brew upgrade
brew cleanup

# link apps
brew linkapps
