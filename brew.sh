#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash
brew install bash-completion

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap josegonzalez/homebrew-php

# Install everything else
brew install ack
brew install git
brew install rename
brew install tree
brew install python
brew install python3
brew install ruby
brew install node
brew install vim

# update setuptools, pip and pip3
pip install --upgrade setuptools
pip install --upgrade pip
pip3 install --upgrade pip

# Remove outdated versions from the cellar
brew cleanup

# link apps
brew linkapps
