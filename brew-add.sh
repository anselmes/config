#!/usr/bin/env bash
# Docker
#brew install xhyve docker \
#  docker-swarm \
#  docker-machine \
#  docker-compose \
#  docker-machine-driver-xhyve

# Bash Completion
brew install apm-bash-completion \
  bash-completion \
  brew-cask-completion \
#  docker-completion \
#  docker-machine-completion \
#  gem-completion \
#  pip-completion \
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
  google-drive \
#  google-earth-web-plugin \
  hosts \
#  kodi \
  megasync \
#  private-internet-access \
  skype \
  teamviewer \
  tranmission \
  mplayerx
#  vlc \
#  virtualbox \
#  virtualbox-extension-pack \
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
