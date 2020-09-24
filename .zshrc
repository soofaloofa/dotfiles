# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git colorize extract virtualenv)
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG="en_US.UTF-8"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# jump 
eval "$(jump shell)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export PATH=:$HOME/.jenv/shims:$PATH

# opam
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# go
if which go > /dev/null; then
  export GOROOT=$(go env GOROOT)
  export GOPATH=$HOME/Projects/golang
  export PATH=$GOROOT/:$PATH
fi

# Brew
if which brew > /dev/null; then 
  export PATH=$(brew --prefix)/bin:$PATH 
fi

# Dart
export PATH="$PATH":"$HOME/.pub-cache/bin"

# PyEnv
if which pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)" 
fi

# Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Aliases
alias vim="nvim"
alias zshconfig="vim $HOME/.zshrc"

# Load any secrets not to commit to Github 
if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
