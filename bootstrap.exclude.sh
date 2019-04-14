#!/bin/sh
export EMAIL="ahrjarrett@gmail.com"
export WEBSITE="https://ahrjarrett.com"
export EXCLUDED_FILES="\.exclude*|scripts|\.DS_Store|\.git$|\.gitignore$|.*.md$|.*.org$"
export PROJECTS_PATH="$HOME/code"
export DOTFILES="$PROJECTS_PATH/dotfiles"
export USER_RUBY_VERSION="2.6.1"
export USER_RAILS_VERSION="5.2.0"
export NPM_USERNAME="ahrjarrett"
GITHUB_USERNAME="ahrjarrett"
DEFAULT_SHELL="fish"
SHELL_REPONAME="fish"
export SHELL_REMOTE_REPO="git@github.com:$GITHUB_USERNAME/$SHELL_REPONAME.git"

givesPermission() {
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    return 0
  else
    return 1
  fi
}

init() {
  echo "Bootstrapping your Mac..."
	echo "\nMakes a projects folder at $PROJECTS_PATH if it doesn't already exist"
  if givesPermission; then
    echo "Creating projects folder at $PROJECTS_PATH..."
    mkdir -p "$PROJECTS_PATH"
  else
    echo "Well, I guess we won't do that then."
  fi
}

generate_ssh() {
  echo "\nThis utility will generate SSH keys for you"
  if givesPermission; then
    echo "Generating keys..."
    sh scripts/ssh.sh
  else
    echo "SSH utility cancelled by user"
  fi
}

link() {
	echo "\nThis utility will symlink the files in this repo to $HOME"
  if givesPermission; then
    echo "Symlinking..."
    sh scripts/link.sh
  else
    echo "Symlinking cancelled by user"
  fi
}


fetch_repos() {
  echo "\nThis utility will download repos for your configuration"
  if givesPermission; then
    echo "Cloning fish config from $SHELL_REMOTE_REPO"
    git clone "$SHELL_REMOTE_REPO" "./fish"
    cd ".."
  else
    echo "Fetch repos utility cancelled by user"
  fi
}

brew_install() {
  echo "\nThis utility will install useful utilities using Homebrew"
  if givesPermission; then
    echo "Installing useful stuff using brew. This may take a while..."
    sh scripts/brew.sh
  else
    echo "Brew installation cancelled by user"
  fi
}

configure_shell() {
  echo "\nThis utility will configure your $DEFAULT_SHELL shell"
  if givesPermission; then
    echo "Installing dependencies and configuring $DEFAULT_SHELL..."
    # sh scripts/shell.sh
    sh scripts/fish.sh
  else
    echo "$DEFAULT_SHELL shell utility cancelled by user"
  fi
}

osx_defaults() {
  echo "\nThis utility will set a bunch of OS X defaults for you. \nPlease read osx.exclude.sh before running, as many settings are experimental!"
  if givesPermission; then
    echo "Setting OS X defaults..."
    sh scripts/osx.sh
  else
    echo "OS X defaults installation cancelled by user"
  fi
}

setup_ruby() {
  echo "\nThis utility will set up ruby, rbenv and rails for you"
  if givesPermission; then
    echo "Setting up ruby utility defaults..."
    sh scripts/ruby.sh
  else
    echo "Ruby utility cancelled by user"
  fi
}

setup_node() {
  echo "\nThis utility will set up node, configure npm and install global node modules"
  if givesPermission; then
    echo "Setting up node utility defaults..."
    sh scripts/node.sh
  else
    echo "Node utility cancelled by user"
  fi
}

init
generate_ssh
link
fetch_repos
brew_install
configure_shell
osx_defaults
setup_ruby
setup_node
