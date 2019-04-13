#!/bin/sh

#PATH_TO_PROJECTS="~/Desktop/stuff"
EMAIL="ahrjarrett@gmail.com"
PATH_TO_GITHUB_KEY="$HOME/.ssh/github"
FILENAME_SSH_CONFIG="$HOME/.ssh/github"

# Initialize a few things
init () {
	echo "Making a projects folder if it doesn't already exist"
	mkdir -p "$HOME/Desktop/stuff"
}

# TODO : Delete symlinks to deleted files
# Is this where rsync shines?
# TODO - add support for -f and --force
link () {
	echo "\nThis utility will symlink the files in this repo to the home directory"
	echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    # TODO - regex here?
    for file in $( ls -A | grep -vE "\.exclude*|\.DS_Store|\.git$|\.gitignore$|.*.md$|.*.org$" ) ; do
      if [[ "$file" = ".ssh_config" ]] ; then
        mkdir -p "$HOME/.ssh"
        ln -sv "$PWD/.ssh_config" "$HOME/.ssh/config"
      else 
        ln -sv "$PWD/$file" "$HOME"
      fi
    done
    # TODO: source files here?
    echo "Symlinking complete"
  else
    echo "Symlinking cancelled by user"
  return 1
fi
}

gen_github_ssh_key() {
  echo "\nThis utility will generate a GitHub SSH key for you at \n"
  printf "\e[36m  $PATH_TO_GITHUB_KEY  \e[0m\n"
  echo "\nProceed? (Y/n)"
		read -s -n 1 input
		if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
      echo "Generating GitHub SSH key..."
      echo "Using default key name (github)..."
      echo "Adding key location to $HOME/.ssh/config..."
      printf "\n\e[32m$PATH_TO_GITHUB_KEY\e[0m copied to your clipboard \n\n"

      printf $(echo $PATH_TO_GITHUB_KEY) | pbcopy
      ssh-keygen -t rsa -C $EMAIL
      pbcopy < "$PATH_TO_GITHUB_KEY.pub"

      printf "\nContents of \e[32m$PATH_TO_GITHUB_KEY.pub\e[0m copied to your clipboard \n\n"
      echo "Add public key to GitHub"
      read -p $'\e[36mPress [Enter] key to open GitHub →\e[0m'
      open https://github.com/account/ssh
      read -p "Press [Enter] key when finished adding key..."
      echo "GitHub key generated! To check your config, do:"
      echo "$ ssh -T git@github.com"

    else
      echo "SSH utility cancelled by user"
    fi
}

install_tools () {
  echo "\nThis utility will install useful utilities using Homebrew"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    echo "Installing useful stuff using brew. This may take a while..."
    sh brew.exclude.sh
  else
    echo "Brew installation cancelled by user"
  fi
}

osx_defaults () {
  echo "\nThis utility will set a bunch of OS X defaults for you. \n Please read osx.exclude.sh before running, as many settings are experimental!"
  echo "Proceed? (Y/n)"
  read -s -n 1 input
  if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
    echo "Setting OS X defaults..."
    sh osx.exclude.sh
  else
    echo "OS X defaults installation cancelled by user"
  fi
}

init
link
install_tools
gen_github_ssh_key
osx_defaults
