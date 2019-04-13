#!/bin/sh

EMAIL="ahrjarrett@gmail.com"
PROJECTS_DIR="$HOME/Desktop/code"
DEFAULT_SHELL="fish"
EXCLUDED_FILES="\.exclude*|scripts|\.DS_Store|\.git$|\.gitignore$|.*.md$|.*.org$"

# Initialize a few things
init () {
	echo "Making a projects folder if it doesn't already exist..."
	mkdir -p "$PROJECTS_DIR"
}

# TODO : Delete symlinks to deleted files
# rsync might be good for this
link () {
	echo "\nThis utility will symlink the files in this repo to $HOME"
	echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    # TODO - regex here?
    for file in $( ls -A | grep -vE $EXCLUDED_FILES ) ; do
      if [[ "$file" = ".ssh_config" ]] ; then
        mkdir -p "$HOME/.ssh"
        ln -sv "$PWD/.ssh_config" "$HOME/.ssh/config"
      else 
        ln -sv "$PWD/$file" "$HOME"
      fi
    done
    echo "Symlinking complete"
  else
    echo "Symlinking cancelled by user"
  return 1
fi
}

generate_ssh() {
  echo "\nThis utility will generate SSH keys for you\n"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    sh scripts/generate_ssh.sh
  else
    echo "SSH utility cancelled by user"
  fi
}

brew_install() {
  brew install fish
}

brew_install2 () {
  echo "\nThis utility will install useful utilities using Homebrew"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    echo "Installing useful stuff using brew. This may take a while..."
    sh scripts/brew_install.sh
  else
    echo "Brew installation cancelled by user"
  fi
}

configure_shell () {
  echo "\nThis utility will configure your $DEFAULT_SHELL shell"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    echo "Installing dependencies and configuring $DEFAULT_SHELL..."
    sh scripts/configure_shell.sh
  else
    echo "$DEFAULT_SHELL shell utility cancelled by user"
  fi
}

osx_defaults () {
  echo "\nThis utility will set a bunch of OS X defaults for you. \n Please read osx.exclude.sh before running, as many settings are experimental!"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    echo "Setting OS X defaults..."
    sh scripts/osx_defaults.sh
  else
    echo "OS X defaults installation cancelled by user"
  fi
}

init
link
brew_install
configure_shell
#generate_ssh
#osx_defaults
