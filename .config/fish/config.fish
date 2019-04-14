#######################
# GLOBAL VARIABLES
#######################

# main directories
set -xg d $HOME/Desktop
set -xg o $HOME/Documents
set -xg l $HOME/Downloads

# config paths
set -xg DOTFILES $HOME/Desktop/code/dotfiles
set -xg FISH $DOTFILES/.config/fish
set -xg EMACS $DOTFILES/.emacs.d
set -xg FISHFILE $FISH/config.fish
set -xg EMACSFILE $EMACS/readme.org
set -xg BASHFILE $DOTFILES/.bash_profile


#################
# ABBREVIATIONS
#################

# files
abbr -ag fishpath  FISH_PATH
abbr -ag fishfile  FISH_FILE

# config files
abbr -ag cfd   code $DOTFILES/bootstrap.exclude.sh
abbr -ag cff   code $FISH/config.fish
abbr -ag cfb   code $BASHFILE
abbr -ag cfe   code $EMACS/readme.org
abbr -ag srcf  source $FISHFILE
abbr -ag srcb  source $BASHFILE
abbr -ag fishit  vim $FISH_PATH/config.fish
abbr -ag bashit  vim $FISH_PATH/config.fish

# filesystem
abbr -ag ll  'ls -alP'

# git
abbr -ag ga   git add -A
abbr -ag gs   git status
abbr -ag gco  git checkout
abbr -ag gcm  git commit -m 

# databases
abbr -ag sqlgo (which mysql).server start
abbr -ag sqlno (which mysql).server stop
abbr -ag sqldoh (which mysql).server restart
abbr -ag pggo launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
abbr -ag pgno launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist


#######################
# BINDINGS
#######################

# bindings
bind \cg cancel # ^-g also cancels (emacs-like)


#######################
# SPACEFISH
#######################

set SPACEFISH_CHAR_SYMBOL "λ"
