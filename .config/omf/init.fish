echo "🐟🐟🐟 running init.fish 🐟🐟🐟"

# GLOBALS
set -xg PROJECTS_PATH $HOME/code
set -xg DOTFILES $PROJECTS_PATH/dotfiles
set -xg OMF $DOTFILES/.config/omf
# versions
set -xg USER_RUBY_VERSION 2.6.1
set -xg USER_RAILS_VERSION 5.2.0

set -xg EMACS_PATH $DOTFILES/.emacs.d
set -xg BEFORE_INIT_FILE $OMF/before.init.fish
set -xg INIT_FILE $OMF/init.fish
set -xg EMACS_FILE $EMACS/readme.org
set -xg BASH_FILE $DOTFILES/.bash_profile

# EXPORTS
set -x EDITOR code
set -x BROWSER chrome

# ABBREVS
abbr -ag d $HOME/Desktop
abbr -ag o $HOME/Documents
abbr -ag l $HOME/Downloads
abbr -ag s $HOME/code

# config files
abbr -ag cfdf    $EDITOR $DOTFILES/bootstrap.exclude.sh
abbr -ag cff     $EDITOR $INIT_FILE
abbr -ag cfb     $EDITOR $BASH_FILE
abbr -ag cfe     $EDITOR $EMACS_PATH/readme.org
abbr -ag srcf    source $INIT_FILE
abbr -ag srcb    source $BASH_FILE
abbr -ag fishit  vim $INIT_FILE
abbr -ag bashit  vim $BASH_FILE
abbr -ag opendf  open $DOTFILES
abbr -ag openff  open $OMF
# `cd` there
abbr -ag dotfiles  $DOTFILES
abbr -ag fishfiles  $OMF
abbr -ag ffs  $OMF

# common shell commands
abbr -ag ll  ls -alP
abbr -ag c   clear
abbr -ag sshutdown  sudo shutdown -h now
# git
abbr -ag ga     git add -A
abbr -ag gs     git status
abbr -ag gco    git checkout
abbr -ag gcm    git commit -m
abbr -ag gpom   git push origin master

# databases
abbr -ag sqlgo   (which mysql).server start
abbr -ag sqlno   (which mysql).server stop
abbr -ag sqldoh  (which mysql).server restart
abbr -ag pggo  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
abbr -ag pgno  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
### If you want ^^ launched automatically at login: ###
# To have launchd start mysql at login:
#brew services start mysql
# To have launchd start postgresql at login:
#brew services start postgresql

# omf
### Not working?
#abbr -ag try theme


# PATH
status --is-interactive; and source (rbenv init -|psub)





