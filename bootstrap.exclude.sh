#!/bin/sh

export PROJECTS_PATH="$HOME/code"
export DOTFILES="$PROJECTS_PATH/dotfiles"
export EMAIL="ahrjarrett@gmail.com"
export EXCLUDED_FILES="\.exclude*|scripts|\.DS_Store|\.git$|\.gitignore$|.*.md$|.*.org$"
DEFAULT_SHELL="fish"
GITHUB_SSH="git@github.com"
GITHUB_USER="ahrjarrett"
SHELL_REPONAME="fish.d"
export SHELL_REPO=$GITHUB_SSH:$GITHUB_USER/$SHELL_REPONAME.git

init() {
	echo "Making a projects folder at $PROJECTS_PATH if it doesn't already exist..."
	mkdir -p "$PROJECTS_PATH"
}

link() {
	echo "\nThis utility will symlink the files in this repo to $HOME"
	echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    sh scripts/link.sh
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
    sh scripts/ssh.sh
  else
    echo "SSH utility cancelled by user"
  fi
}

fetch_repos() {
  echo "\nThis utility will download repos for your configuration\n"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    mkdir -p ".config" && cd ".config"
    echo "Cloning fish config from $SHELL_REPO"
    git clone "$SHELL_REPO" "./fish"
    cd ".."
  else
    echo "Fetch repos utility cancelled by user"
  fi
}

brew_install() {
  echo "\nThis utility will install useful utilities using Homebrew"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    echo "Installing useful stuff using brew. This may take a while..."
    sh scripts/brew.sh
  else
    echo "Brew installation cancelled by user"
  fi
}

configure_shell() {
  echo "\nThis utility will configure your $DEFAULT_SHELL shell"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    echo "Installing dependencies and configuring $DEFAULT_SHELL..."

    sh scripts/shell.sh
  else
    echo "$DEFAULT_SHELL shell utility cancelled by user"
  fi
}

osx_defaults() {
  echo "\nThis utility will set a bunch of OS X defaults for you. \n Please read osx.exclude.sh before running, as many settings are experimental!"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    echo "Setting OS X defaults..."
    sh scripts/osx.sh
  else
    echo "OS X defaults installation cancelled by user"
  fi
}


init
generate_ssh
link
fetch_repos
#brew_install
configure_shell
#osx_defaults
