#!/usr/bin/env bash
# Docker
brew install xhyve docker\
  docker-swarm\
  docker-machine\
  docker-compose\
  docker-machine-driver-xhyve

# Bash Completion
brew install apm-bash-completion\
  bash-completion\
  brew-cask-completion\
  docker-completion\
  docker-machine-completion\
  gem-completion\
  pip-completion\
  ruby-completion\
  ruby-completion

# Cask apps
brew cask\
  install\
  anylist\
  appcleaner\
  batchmod\
  dropbox\
  firefox\
  flux\
  google-drive\
  google-earth-web-plugin\
  hosts\
  kodi\
  megasync\
  private-internet-access\
  skype\
  slack\
  teamviewer\
  tranmission-nightly\
  virtualbox\
  virtualbox-extension-pack\
  vmware-fusion\
  wireshark\
  wwdc
brew cask install atom-beta
brew cask install vlc-nightly
# brew cask install atom
# brew cask install transmission
# brew cask install vlc

# Brew Cask
brew cask update
brew cask cleanup

# Remove outdated versions from the cellar
brew update
brew upgrade
brew cleanup

# link apps
brew linkapps
