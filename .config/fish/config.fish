set DOTFILES_DIR $HOME/Desktop/code/dotfiles
set FISH_DIR $DOTFILES_DIR/.config/fish

# # PATH
# set -x PATH $HOME/.rbenv/bin $PATH
# rbenv init - | source
# source (rbenv init - | psub)


# ALIASES
alias gs="git status"
alias ga="git add -A"
alias fishit="vim $FISH_DIR/config.fish"
alias ll="ls -alP"
### MySQL
alias mysql_start="/usr/local/bin/mysql.server start"
alias mysql_stop="/usr/local/bin/mysql.server stop"
alias mysql_restart="/usr/local/bin/mysql.server restart"
### Postgres
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

# PACKAGES
