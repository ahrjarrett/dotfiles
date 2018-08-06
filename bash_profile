# title / prompt
case $TERM in
    xterm*)
        PS1="\[\033]0;\u@\h \w\007\]\[\033[01;33m\][\[\033[00m\]\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;31m\]\w\[\033[00m\]\[\033[01;33m\]]\[\033[00m\]\n\[\033[01;31m\]$ \[\033[00m\]"
        ;;
    *)
        PS1="\[\033[01;33m\][\[\033[00m\]\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;31m\]\w\[\033[00m\]\[\033[01;33m\]]\[\033[00m\]\n\[\033[01;31m\]$ \[\033[00m\]"
        ;;
esac

# ls colors by platform
if [ "$(uname -s)" = "Darwin" ]; then
    export CLICOLOR=1
    export LSCOLORS=BxDxFxFxGxFxFxFxFxFxFx
    alias ls='CLICOLOR_FORCE=1 ls'
elif [ "$(uname -s)" = "Linux" ]; then
    export LS_COLORS="di=1;31:ln=1;93:so=1;35:pi=1;35:ex=1;36:bd=1;35:cd=1;35:su=1;35:sg=1;35:tw=1;35:ow=1;35:"
    alias ls="ls --color"
fi

# chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

# os x config
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# aliases
alias ll="ls -alF"
alias pd="pwd"
alias c="clear"
alias showit="defaults write com.apple.finder AppleShowAllFiles -bool TRUE && killall Finder"
alias hideit="defaults write com.apple.finder AppleShowAllFiles -bool FALSE && killall Finder"
alias bashit="vim ~/.bash_profile"
alias ga="git add -A"
alias gs="git status"
alias chrome="open /Applications/Google\ Chrome.app"

curlpurge() {
  curl -XPURGE -H 'Fastly-Soft-Purge: 1' "$@" | jsome
}

# copies the timestamp in UTC to os x clipboard:
utc() {
  TZ=":UTC" date +"%T" | pbcopy
  TZ=":UTC" date +"%T"
}
