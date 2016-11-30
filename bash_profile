alias ll="ls -alt"
alias pd="pwd"
alias c="clear"
alias showit="defaults write com.apple.finder AppleShowAllFiles -bool TRUE && killall Finder"
alias hideit="defaults write com.apple.finder AppleShowAllFiles -bool FALSE && killall Finder"
alias bashit="vim ~/.bash_profile"
alias vimmit="vim ~/.vimrc"
alias ga="git add ."
alias gs="git status"
alias chrome="open /Applications/Google\ Chrome.app"
alias pomo="ding in 25m"
alias pi="ssh pi@192.168.1.27"

echo "HUSTLE."
export PS1='>> '


export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
