#!/usr/bin/env bash

# install homebrew if not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
  echo "Homebrew not installed. Attempting to install Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      if [ ! "$?" -eq 0 ] ; then
    	  echo "Something is borked. Exiting..." && exit 1
  fi
fi

echo "Updating homebrew & upgrading any packages already installed..."
brew update
brew upgrade


##### NOTE: git commented out bc not sure whether
##### better to handle in bootstrap script instead
#################################################
### GIT
#################################################
# echo "Installing git..."
# brew install git
# echo "Configuring git for cloning stuff:"
# git config --global user.name "Andrew Jarrett"
# git config --global user.name "ahrjarrett@gmail.com"
# echo "Git configuration:"
# git config --list --show-origin

#################################################
### LANGUAGES                                 
#################################################
echo "Installing languages..."
brew install python # python3
brew install rbenv

#################################################
### PACKAGES & UTILS
#################################################
echo "Installing packages & utils..."
brew install node
brew install tree
brew install heroku
brew install yarn
brew install docker
brew install httpie

#################################################
### DBs
#################################################
echo "Installing databases..."
brew install postgresql

#################################################
### SHELL
#################################################
brew install fish
echo "Adding fish to /etc/shells and making fish the default shell..."
sudo grep -qxF "$(which fish)" /etc/shells || echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

echo "Adding fisher..."
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish


brew cleanup


#################################################
### APPS
#################################################
apps=(
  dropbox
  #emacs
  google-chrome
  keycastr
  slack
  sequel-pro
  spectacle
  spotify
  the-unarchiver
  visual-studio-code
  vlc
  sketch
)

echo "Installing apps with Cask..."
brew cask install --force --appdir="/Applications" ${apps[@]}


#################################################
### FONTS
#################################################
echo "Installing fonts with Cask..."
brew tap caskroom/fonts && brew cask install font-fira-code




brew cleanup

# brew install coreutils
# brew install gdb
### FONTS??
# The Fire Code font
# https://github.com/tonsky/FiraCode
# This method of installation is
# not officially supported, might install outdated version
# Change font in terminal preferences
brew tap caskroom/fonts
brew cask install font-fira-code
# monoid cask install currently broken?
#brew tap sscotth/monoid && brew cask install font-monoid

