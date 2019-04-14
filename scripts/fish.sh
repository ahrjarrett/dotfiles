#!/bin/sh

echo "Installing oh my fish...🐟"
curl -L https://get.oh-my.fish | fish

cho "Adding fish to /etc/shells and making fish the default shell..."
sudo grep -qxF "$(which fish)" /etc/shells || echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

printf "\n\e[36mfish install complete\e[0m\n"

