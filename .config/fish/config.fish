# PATH
set -x PATH $HOME/.rbenv/bin $PATH
rbenv init - | source

# ALIASES
alias gs="git status"
alias ga="git add -A"
alias fishit="vim ~/.config/fish/config.fish"
alias ll="ls -Alp"
### MySQL
alias mysql_start="/usr/local/bin/mysql.server start"
alias mysql_stop="/usr/local/bin/mysql.server stop"
alias mysql_restart="/usr/local/bin/mysql.server restart"
### Postgres
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
