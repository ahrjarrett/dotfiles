#!/bin/sh

DOTFILES_DIR="$HOME/Desktop/code/dotfiles"
FISH_DIR="$DOTFILES_DIR/.config/fish"

echo "Installing fisher...."
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

echo "Installing spacefish...."
fish -c "fisher add matchai/spacefish"

# echo "fisher installation & fish config doesn't happen here anymore!"
# echo "To dive in, start a new Terminal session or run: \n"
# echo "Restarting config.fish by running:"
# echo "  $ source $FISH_DIR/config.fish"

echo "Adding fish to /etc/shells and making fish the default shell..."
sudo grep -qxF "$(which fish)" /etc/shells || echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

printf "\n\e[36m🐠🐠🐠 fish install complete 🐠🐠🐠\e[0m\n"



### OLD: Used to install fisher here, moved to config.fish file
#curl https://git.io/fisher --create-dirs -sLo "$FISH_DIR/functions/fisher.fish"