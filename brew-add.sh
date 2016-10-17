#!/usr/bin/env bash

# Bash Completion
brew install \
  apm-bash-completion \
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
  # docker \
  dropbox \
  firefox \
  flux \
  google-drive \
  hirundo \
  hosts \
  kitematic \
  kodi \
  megasync \
  owncloud \
  pgadmin3 \
  protobuf-swift \
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
