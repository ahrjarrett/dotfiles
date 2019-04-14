set DOTFILES_PATH $HOME/Desktop/code/dotfiles
set FISH_PATH $DOTFILES_PATH/.config/fish
set FISH_FILE = $FISHPATH/config.fish

# directory aliases
abbr -ag d $HOME/Desktop
abbr -ag o $HOME/Documents
abbr -ag l $HOME/Downloads
abbr -ag c $HOME/Desktop/code
abbr -ag e $HOME/.emacs.d
abbr -ag s $HOME/stuff


# files
abbr -ag fishpath FISH_PATH
abbr -ag fishfile FISH_FILE
abbr -ag bashfile $HOME/.bash_profile

# config files
abbr -ag fishit vim $FISH_PATH/config.fish
abbr -ag cff vim $FISH_PATH/config.fish
abbr -ag bashit vim $FISH_PATH/config.fish
abbr -ag cfb vim $FISH_PATH/config.fish

# filesystem
abbr -ag ll 'ls -alP'


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

set SPACEFISH_CHAR_SYMBOL "λ "
