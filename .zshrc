# Powerlevel 10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git colorize extract macos common-aliases kubectl)
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG="en_US.UTF-8"

# Aliases
alias vi="nvim"
alias vim="nvim"
alias zshconfig="vim $HOME/.zshrc"

# Functions
function portkill() {
  kill -9 $(sudo lsof -i :$1 | tail -1 | awk '{print $2}')
}

# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# Jump
eval "$(jump shell)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# gpg
export GPG_TTY=$TTY

# rust
export CARGO_NET_GIT_FETCH_WITH_CLI=true

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

# java
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/eclipse/lombok.jar"

# gcloud
if [ -f '/Users/kevinsookocheff/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kevinsookocheff/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/kevinsookocheff/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kevinsookocheff/google-cloud-sdk/completion.zsh.inc'; fi

# asdf
if [ -f '/opt/homebrew/opt/asdf/libexec/asdf.sh' ]; then
  source /opt/homebrew/opt/asdf/libexec/asdf.sh
fi
if [ -f '~/.asdf/plugins/java/set-java-home.zsh' ]; then
  source ~/.asdf/plugins/java/set-java-home.zsh
fi

# kubernetes
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# dart
export PATH="$PATH:$HOME/.pub-cache/bin"

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# wk
if [ -f "$HOME/.wk/profile" ]; then
  source $HOME/.wk/profile
  export KUBECONFIG=~/.wk/config/eks.yaml
fi

# Home
export PATH=$PATH:"$HOME/bin"
source $HOME/.secrets
