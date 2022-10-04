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

# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# Jump 
eval "$(jump shell)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# gpg
export GPG_TTY=$(tty)

# asdf 
source /opt/homebrew/opt/asdf/libexec/asdf.sh
source ~/.asdf/plugins/java/set-java-home.zsh

# go
export GOPATH=$(go env GOPATH)
export GOROOT=$(go env GOROOT)
export GOBIN=$(go env GOBIN)
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN

# scala
export PATH=$PATH:"$HOME/Library/Application Support/Coursier/bin"

# Aliases
alias vi="nvim"
alias vim="nvim"
alias zshconfig="vim $HOME/.zshrc"

# gcloud
if [ -f '/Users/kevinsookocheff/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kevinsookocheff/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/kevinsookocheff/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kevinsookocheff/google-cloud-sdk/completion.zsh.inc'; fi

# wk
source ~/.wk/profile
export PATH="/opt/homebrew/opt/go@1.16/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"
