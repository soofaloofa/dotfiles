# oh-my-zsh
DEFAULT_USER="$USER"
ZSH_THEME=""  # use pure theme later
export ZSH=$HOME/.oh-my-zsh
plugins=(vi-mode git colorize extract macos common-aliases kubectl kube-ps1)
source $ZSH/oh-my-zsh.sh

# Homebrew
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# pure theme https://github.com/sindresorhus/pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# kube-ps1
PROMPT='$(kube_ps1) '$PROMPT

# vi mode
export KEYTIMEOUT=1
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

# User configuration
export LANG="en_US.UTF-8"

# Aliases
alias vi="nvim"
alias vim="nvim"
alias vgit='nvim -c "Git" -c "only"'
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
  export GOPRIVATE=github.com/Workiva
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

# fnm (node)
eval "$(fnm env --use-on-cd --shell zsh)"


# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add VS Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# wk
if [ -f "$HOME/.wk/profile" ]; then
  source $HOME/.wk/profile
  export NPM_TOKEN=$(grep '_auth' ~/.wk/config/npm.toml | sed 's/.*_auth *= *"//;s/"//')
  export NPM_CONFIG__AUTH="$NPM_TOKEN"
fi
# revert wk changes to AWS/EKS
# unset AWS_SHARED_CREDENTIALS_FILE
unset KUBECONFIG

# Secrets
source "$HOME/bin/secrets.sh"

# Home
export PATH=$PATH:"$HOME/bin:$HOME/.local/bin"
