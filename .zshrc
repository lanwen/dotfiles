# Activate mise-managed development tools.
eval "$(/opt/homebrew/bin/mise activate zsh)"

#fzf
source <(fzf --zsh)

alias ps='procs'
alias vi='nvim'
alias ll='eza -lah --git'
alias lt='eza --tree --level=2'
alias du='dust'
alias df='duf'
alias tf=terraform
alias k=kubectl

export BAT_THEME=ansi
export EDITOR='nvim'
export VISUAL='nvim'
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Launch herdr automatically in Ghostty's quick terminal.
if [[ -o interactive && "$GHOSTTY_QUICK_TERMINAL" == "1"
      && -z "$HERDR_QUICK_TERMINAL_STARTED"
      && -z "$HERDR_ENV" && -z "$HERDR_PANE_ID" ]]; then
  export HERDR_QUICK_TERMINAL_STARTED=1
  env -u GHOSTTY_QUICK_TERMINAL /opt/homebrew/bin/herdr
fi

# safe-defaults: package-manager wrappers
export PATH="/Users/lanwen/.local/bin:$PATH"
export PATH="/Users/lanwen/bin:$PATH"

oci-auth() {
    export OCI_CLI_KEY_CONTENT="$(op read "op://Private/zz2fpyuhmorsssme5o4peepdoi/private key")"
}

oci() {
    if [[ -z "${OCI_CLI_KEY_CONTENT:-}" ]]; then
      oci-auth
    fi

    command oci "$@"
}

eval "$(zoxide init --cmd cd zsh)"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
