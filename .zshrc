# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh installation.
export ZSH="/Users/kevinsookocheff/.oh-my-zsh"
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

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# opam
test -r /Users/kevinsookocheff/.opam/opam-init/init.sh && . /Users/kevinsookocheff/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# go
export GOROOT=$(go env GOROOT)
export GOPATH=$HOME/Projects/golang
export PATH=$(brew --prefix)/bin:$HOME/bin:$HOME/.rvm/bin:$GOROOT/:$HOME/.jenv/shims:bin:$PATH

# PyEnv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)" 
export PIP_REQUIRE_VIRTUALENV=true
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Aliases
alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Load any secrets not to commit to Github 
if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
