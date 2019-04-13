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
	echo "Proceed? (y/n)"
	read input
	# TODO - regex here?
	if [ "$input" = 'y' -o "$input" = 'Y' ] ; then
		for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore$|.*.md$|.*.org$' ) ; do
			ln -sv "$PWD/$file" "$HOME"
		done
		# TODO: source files here?
		echo "Symlinking complete"
	else
		echo "Symlinking cancelled by user"
		return 1
	fi
}

install_tools () {
	if [ $( echo "$OSTYPE" | grep 'darwin' ) ] ; then
		echo "\nThis utility will install useful utilities using Homebrew"
		echo "Proceed? (y/n)"
		read input
		# TODO - regex here?
		if [ "$input" = 'y' -o "$input" = 'Y' ] ; then
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
