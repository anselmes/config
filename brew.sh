#!/usr/bin/env bash
# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils --with-gmp
#echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to  \$PATH."
# Install GNU `find`, `locate`, `updatedb`, and `xargs`
brew install findutils --with-default-names
# Install Bash 4
brew install \
 bash \
 bash-completion

# Install wget with IRI support
brew install wget --with-{iri,libmetalink,pcre}

# Install more recent versions of some OS X tools
brew tap \
  alehouse/homebrew-unofficial \
  caskroom/cask \
  caskroom/fonts \
  homebrew/dupes \
  homebrew/homebrew-php \
  homebrew/versions \
  josegonzalez/homebrew-php
#brew install homebrew/dupes/grep

# Install everything else
brew install \
  git --with-brewed-openssl \
  ssh-copy-id \
  tree \
  node --with-{debug,full-icu,openssl} \
  python --with-{berkely-db4,poll,tcl-tk,sphinx-doc} \
  python3 --with-{tcl-tk,sphinx-doc} \
  ruby --with-{doc,gdbm,libffi,tcltk} \
  vim --with-{lua,python3,tcl}
  ack \
  rename \
#  swift \

# Cask
brew cask install \
  flash-npapi \
  java \
  silverlight \
  xquartz

# update setuptools, pip and pip3
pip3 install --upgrade setuptools pip wheel
pip install --upgrade setuptools pip

# Remove outdated versions from the cellar
brew cleanup

# link apps
brew linkapps

# Brew Cask
brew cask update
brew cask cleanup
