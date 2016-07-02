#!/usr/bin/env bash
# Docker
#brew install xhyve docker \
#  docker-swarm \
#  docker-machine \
#  docker-compose \
#  docker-machine-driver-xhyve

# Bash Completion
brew install \
  apm-bash-completion \
  bash-completion \
  brew-cask-completion \
  launchctl-completion \
  open-completion \
  pip-completion \
#  docker-completion \
#  docker-machine-completion \
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
  google-drive \
  hosts \
  megasync \
  skype \
  teamviewer \
  tranmission \
  mplayerx
  vmware-fusion \
  wireshark \
  wwdc
#  google-earth-web-plugin \
#  kodi \
#  private-internet-access \
#  vlc \
#  virtualbox \
#  virtualbox-extension-pack \

# Brew Cask
brew cask update
brew cask cleanup

# Remove outdated versions from the cellar
brew update
brew upgrade
brew cleanup

# link apps
brew linkapps
