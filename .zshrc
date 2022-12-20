# Powerlevel 10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git colorize extract macos)
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG="en_US.UTF-8"

# Aliases
alias vi="nvim"
alias vim="nvim"
alias zshconfig="vim $HOME/.zshrc"

alias preview='open -a "${PREVIEW?}"'
alias f='open -a Finder .'
alias next='music next'
alias prev='music previous'
alias pause='music pause'
alias play='music play'
alias song='music playing'
alias mute='music mute'
alias unmute='music unmute'

# Functions
function rsdoc() {
  docker-compose -f docker-compose.yml stop $1
  docker-compose -f docker-compose.yml rm -f $1
  docker-compose -f docker-compose.yml up -d $1
}

# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# Jump
eval "$(jump shell)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# gpg
export GPG_TTY=$(tty)

# rust
export CARGO_NET_GIT_FETCH_WITH_CLI=true

# go
export GOPRIVATE=github.com/Workiva/*
export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export GOBIN=$(go env GOBIN)
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN

# scala
export PATH=$PATH:"$HOME/Library/Application Support/Coursier/bin"

# gcloud
if [ -f '/Users/kevinsookocheff/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kevinsookocheff/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/kevinsookocheff/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kevinsookocheff/google-cloud-sdk/completion.zsh.inc'; fi

# mongo
export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.sh
source ~/.asdf/plugins/java/set-java-home.zsh
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# wk
source ~/.wk/profile
export PATH="/opt/homebrew/opt/go@1.16/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export PATH=$PATH:"$HOME/bin"

