# oh-my-zsh
DEFAULT_USER="$USER"
export ZSH=$HOME/.oh-my-zsh
plugins=(git colorize extract macos common-aliases kubectl)
source $ZSH/oh-my-zsh.sh

# Homebrew
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# pure theme https://github.com/sindresorhus/pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# User configuration
export LANG="en_US.UTF-8"

# Aliases
alias vi="nvim"
alias vim="nvim"
alias zshconfig="nvim $HOME/.zshrc"

# Jump
eval "$(jump shell)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# gpg
export GPG_TTY=$TTY

# go
if command -v go &> /dev/null
then
  export GO111MODULE="on"  # forces modules on working directories within GOPATH
  export GOPATH=$(go env GOPATH)
  export GOROOT=$(go env GOROOT)
  export GOBIN=$(go env GOBIN)
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:$GOROOT/bin
  export PATH=$PATH:$GOBIN
fi

# kubernetes
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add VS code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# wk
if [ -f "$HOME/.wk/profile" ]; then
  source $HOME/.wk/profile
  export GOPRIVATE=github.com/Workiva
fi

# Home
export PATH=$PATH:"$HOME/bin:$HOME/.local/bin"
