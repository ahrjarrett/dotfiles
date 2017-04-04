alias ll="ls -alF"
alias pd="pwd"
alias c="clear"
alias showit="defaults write com.apple.finder AppleShowAllFiles -bool TRUE && killall Finder"
alias hideit="defaults write com.apple.finder AppleShowAllFiles -bool FALSE && killall Finder"
alias bashit="vim ~/.bash_profile"
alias vimmit="vim ~/.vimrc"
alias tmuxit="vim ~/.tmux.conf"
alias ga="git add -A"
alias gs="git status"
alias chrome="open /Applications/Google\ Chrome.app"
alias pomo="ding in 25m"

echo "HUSTLE."
export PS1='>> '

#export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

eval "$(jenv init -)"

export NVM_DIR="/Users/aj/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
