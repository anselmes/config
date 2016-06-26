#!/usr/bin/env bash
# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
#brew install coreutils
#echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to  \$PATH."
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
#brew install findutils
# Install Bash 4
brew install \
#  bash \
  bash-completion

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew tap homebrew/dupes \
  alehouse/homebrew-unofficial \
  homebrew/versions \
  caskroom/fonts \
  caskroom/cask \
  homebrew/homebrew-php \
  josegonzalez/homebrew-php
#brew install homebrew/dupes/grep

# Install everything else
brew install \
#  ack \
#  git \
#  rename \
#  tree \
#  python \
#  python3 \
#  ruby \
#  node \
#  vim \
#  swift \
  ssh-copy-id

# Cask
brew cask install flash
  java \
  silverlight \
  xquartz

# update setuptools, pip and pip3
pip install --upgrade setuptools
pip install --upgrade pip
#pip3 install --upgrade pip

# Remove outdated versions from the cellar
brew cleanup

# link apps
brew linkapps

# Brew Cask
brew cask update
brew cask cleanup
