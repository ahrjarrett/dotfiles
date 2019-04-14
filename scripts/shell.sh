#!/bin/sh

DOTFILES_PATH="$HOME/Desktop/code/dotfiles"
FISH_PATH="$DOTFILES_PATH/.config/fish"

echo "Installing fisher...."
curl https://git.io/fisher --create-dirs -sLo "$FISH_PATH/functions/fisher.fish"

echo "Adding fish to /etc/shells and making fish the default shell..."
sudo grep -qxF "$(which fish)" /etc/shells || echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

echo "Installing spacefish...."
fish -c "fisher add matchai/spacefish"
echo "Installing gruvbox theme...."
fish -c "fisher add Jomik/fish-gruvbox"

printf "\n\e[36m🐠🐠🐠 fish install complete 🐠🐠🐠\e[0m\n"

