#!/bin/sh

EMAIL="ahrjarrett@gmail.com"
PATH_TO_GITHUB_KEY="$HOME/.ssh/github"
FILENAME_SSH_CONFIG="$HOME/.ssh/config"

generate_github_ssh () {
  echo "\nGenerating GitHub SSH key for you at: \n"
  printf "\e[36m  $PATH_TO_GITHUB_KEY  \e[0m\n"

  echo "Generating GitHub SSH key..."
  echo "Using default key name (github)..."
  echo "Adding key location to $FILENAME_SSH_CONFIG..."
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
}

generate_github_ssh
