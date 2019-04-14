#!/bin/bash
node_packages=(
  n
  nodemon
  create-react-app
)

NPMRC="$HOME/.npmrc"
echo "Configuring npm..."
npm login
echo "Creating global user config in ~/.npmrc file..."
echo "username=$NPM_USERNAME" >> $NPMRC
echo "email=$EMAIL" >> $NPMRC
echo "website=$WEBSITE" >> $NPMRC
echo "init-license=MIT" >> $NPMRC
echo "save-exact=true" >> $NPMRC
echo "scripts-prepend-node-path=true" >> $NPMRC

echo "Installing global node packages..."
echo "Installing packages: \n\n${node_packages[@]}"
npm i -g ${node_packages[@]}