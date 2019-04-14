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
abbr -ag fishit   vim $FISH_PATH/config.fish
abbr -ag bashit   vim $FISH_PATH/config.fish

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
