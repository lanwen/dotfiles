# Activate mise-managed development tools.
eval "$(/opt/homebrew/bin/mise activate zsh)"

#fzf
source <(fzf --zsh)

alias ps='procs'
alias vi='nvim'
alias ll='ls -lah'

export EDITOR='nvim'
export VISUAL='nvim'

# Launch herdr automatically in Ghostty's quick terminal.
if [[ -o interactive && "$GHOSTTY_QUICK_TERMINAL" == "1"
      && -z "$HERDR_QUICK_TERMINAL_STARTED"
      && -z "$HERDR_ENV" && -z "$HERDR_PANE_ID" ]]; then
  export HERDR_QUICK_TERMINAL_STARTED=1
  env -u GHOSTTY_QUICK_TERMINAL /opt/homebrew/bin/herdr
fi

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

eval "$(zoxide init --cmd cd zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
