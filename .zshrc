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
. /opt/homebrew/opt/asdf/libexec/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh

# Aliases
alias vim="nvim"
alias zshconfig="vim $HOME/.zshrc"
