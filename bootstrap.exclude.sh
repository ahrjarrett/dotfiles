#!/bin/sh

PROJECTS_DIR="$HOME/Desktop/code"
DEFAULT_SHELL="fish"
EXCLUDED_FILES="\.exclude*|scripts|\.DS_Store|\.git$|\.gitignore$|.*.md$|.*.org$"



# DELETE WHEN REMOVING HACK FISHER INSTALL IN CONFIGURE_SCRIPTS
FISH_PATH="$PROJECTS_DIR/dotfiles/.config/fish"

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
    sh scripts/ssh.sh
  else
    echo "SSH utility cancelled by user"
  fi
}

brew_install () {
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

configure_shell () {
  echo "\nThis utility will configure your $DEFAULT_SHELL shell"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    echo "Installing dependencies and configuring $DEFAULT_SHELL..."

    # HACK, move this to configure_shell script soon; here for now 
    echo "Installing fisher...."
    curl https://git.io/fisher --create-dirs -sLo "$FISH_PATH/functions/fisher.fish"

    sh scripts/shell.sh
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
    sh scripts/osx.sh
  else
    echo "OS X defaults installation cancelled by user"
  fi
}


#init
link
#brew_install
configure_shell
#generate_ssh
#osx_defaults
