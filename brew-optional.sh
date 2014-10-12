#!/bin/bash

# initial brew commands
brew doctor
brew update

# install homebrew packages
brew install passenger mysql php56 composer phpunit behat
brew install php56-mcrypt php56-imagick php56-memcache php56-apcu php56-redis php56-mongo php56-phalcon php56-xdebug

# enable autoload and start mysql
sudo ln -sfv /usr/local/opt/mysql/*.plist /Library/LaunchDaemons/
sudo chmod -Rf 644 /Library/LaunchDaemons/homebrew.mxcl.mysql.plist 
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.mysql.plist
