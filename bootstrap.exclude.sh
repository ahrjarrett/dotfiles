#!/bin/sh

#$PATH_TO_PROJECTS="~/Desktop/stuff"

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
		for file in $( ls -A | grep -vE "\.exclude*|\.git$|\.gitignore$|.*.md$|.*.org$" ) ; do
			ln -sv "$PWD/$file" "$HOME"
		done
		# TODO: source files here?
		echo "Symlinking complete"
	else
		echo "Symlinking cancelled by user"
		return 1
	fi
}

gen_github_ssh_key() {
  echo "\nThis utility will generate a GitHub SSH key for you"
  echo "Proceed? (Y/n)"
		read -s -n 1 input
		if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
      echo "Generating GitHub SSH key..."
      echo "Using default key name (github)..."
      printf "\n\e[32m $HOME/.ssh/github copied to your clipboard \e[0m\n\n"

      printf $(echo "$HOME/.ssh/github") | pbcopy
      ssh-keygen -t rsa
      pbcopy < $HOME/.ssh/github.pub
      printf "\n\e[32m Contents of $HOME/.ssh/github.pub copied to your clipboard \e[0m\n\n"
      echo "Add public key to GitHub"
      read -p "Press [Enter] key to open GitHub..."
      open https://github.com/account/ssh
      read -p "Press [Enter] key when finished adding key..."
      echo "GitHub key generated!"

    else
      echo "SSH utility cancelled by user"
    fi
}

install_tools () {
	if [ $( echo "$OSTYPE" | grep "darwin" ) ] ; then
		echo "\nThis utility will install useful utilities using Homebrew"
		echo "Proceed? (Y/n)"
    read -s -n 1 input
    if [[ ("$input" = "y") || ("$input" = "Y") || ("$input" = "") ]] ; then
			echo "Installing useful stuff using brew. This may take a while..."
			sh brew.exclude.sh
		else
			echo "Brew installation cancelled by user"
		fi
	else
		echo "Skipping installations using Homebrew because MacOS was not detected..."
	fi
}

init
link
install_tools
gen_github_ssh_key