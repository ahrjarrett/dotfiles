### DELETE (now shell commands):
#alias showit="defaults write com.apple.finder AppleShowAllFiles -bool TRUE && killall Finder"
#alias hideit="defaults write com.apple.finder AppleShowAllFiles -bool FALSE && killall Finder"


# path
export PATH="/usr/local/opt/imagemagick@6/bin:/usr/local/opt/mysql@5.6:/usr/local/opt/elasticsearch@5.6/bin:$HOME/go/bin/Users/aj2/scripts/utilities:$HOME/.npm-global/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/usr/local/sbin:$PATH"


# title / prompt
case $TERM in
    xterm*)
        PS1="\[\033]0;\u@\h \w\007\]\[\033[01;33m\][\[\033[00m\]\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;31m\]\w\[\033[00m\]\[\033[01;33m\]]\[\033[00m\]\n\[\033[01;31m\]λ \[\033[00m\]"
        ;;
    *)
        PS1="\[\033[01;33m\][\[\033[00m\]\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;31m\]\w\[\033[00m\]\[\033[01;33m\]]\[\033[00m\]\n\[\033[01;31m\]λ \[\033[00m\]"
        ;;
esac

# export PS1="𝝺 "
# ls colors by platform
if [ "$(uname -s)" = "Darwin" ]; then
    export CLICOLOR=1
    export LSCOLORS=BxDxFxFxGxFxFxFxFxFxFx
    alias ls='CLICOLOR_FORCE=1 ls'
elif [ "$(uname -s)" = "Linux" ]; then
    export LS_COLORS="di=1;31:ln=1;93:so=1;35:pi=1;35:ex=1;36:bd=1;35:cd=1;35:su=1;35:sg=1;35:tw=1;35:ow=1;35:"
    alias ls="ls --color"
fi

# os x config
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# aliases
alias ll="ls -alF"
alias pd="pwd"
alias c="clear"
alias vim="nvim"
alias bashit="vim ~/dotfiles/.bash_profile"
alias vimmit="vim ~/dotfiles/nvim/init.vim"
alias ga="git add -A"
alias gs="git status"
alias chrome="open /Applications/Google\ Chrome.app"
alias pomo="ding in 25m"
alias chrome_debug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"

# ssh
alias thegrepper="ssh root@159.65.76.75"
alias projection="ssh projection@172.16.1.101" # P
alias marketplace="ssh jarrett@mp-jobs1.prod"
alias cashdash1="cd ~/.ssh && ssh -i cashdash.pem ec2-user@10.21.2.170"
alias cashdashcelery="cd ~/.ssh && ssh -i cashdash.pem ec2-user@10.21.4.92"

# postgres
#alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
#alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"


# emacs
export EMACS_HOME=${HOME}/.emacs.d
export EMACS_INIT=init.el

emax() {
  open -a Emacs --args --no-splash --fullheight "$@"
}

curlpurge() {
  curl -XPURGE -H 'Fastly-Soft-Purge: 1' $1
}

curlN() {
  for ((i=1;i<=$1;i++));
  do curl -XPURGE -H 'Fastly-Soft-Purge: 1' $2;
  sleep 1;
  done
}

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# eval "$(rbenv init -)"

# source "$HOME/"

# integrate iterm with bash (allows prompt jumping, etc)
source ~/.iterm2_shell_integration.bash



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
