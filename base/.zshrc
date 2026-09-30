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

# Vi mode and Ghostty keys
#
# Vi mode is a zsh command editing mode.
# Ghostty starts zsh before this file sets EDITOR.
# Set vi mode here so every tab uses the same editing keys.
#
# Ghostty sends Option-Left and Option-Right in two formats.
# These bindings move by one word in vi insert mode.
bindkey -v
bindkey -M viins '\e[1;3D' backward-word
bindkey -M viins '\e[1;3C' forward-word
bindkey -M viins '\eb' backward-word
bindkey -M viins '\ef' forward-word
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

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
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/lanwen/.docker/completions $fpath)
autoload -Uz compinit
(( ${+_comps[docker]} )) || compinit
# End of Docker CLI completions

# safe-defaults: package-manager wrappers
export PATH="/Users/lanwen/.local/bin:$PATH"

if (( ! ${+functions[starship_zle-keymap-select]} )); then
  eval "$(starship init zsh)"
elif [[ ${widgets[zle-keymap-select]:-} == user:starship_zle-keymap-select-wrapped ]]; then
  zle -N zle-keymap-select starship_zle-keymap-select
fi

# Prompt mode labels
#
# A keymap is the active set of key bindings.
# Starship reads STARSHIP_ZLE_MODE when it draws the prompt.
# This function sets NORMAL in command mode.
starship_zle-keymap-select() {
  if [[ $KEYMAP == vicmd ]]; then
    export STARSHIP_ZLE_MODE=NORMAL
  else
    unset STARSHIP_ZLE_MODE
  fi
  zle reset-prompt
}

# A redraw hook runs before zsh draws the command line.
# It sets VISUAL while a selection is active.
# It draws the prompt again after the label changes.
starship_visual_indicator() {
  local visual_state=0
  (( REGION_ACTIVE )) && visual_state=1
  [[ ${_STARSHIP_VISUAL_STATE:-0} == $visual_state ]] && return

  typeset -g _STARSHIP_VISUAL_STATE=$visual_state
  if (( visual_state )); then
    export STARSHIP_ZLE_MODE=VISUAL
  elif [[ $KEYMAP == vicmd ]]; then
    export STARSHIP_ZLE_MODE=NORMAL
  else
    unset STARSHIP_ZLE_MODE
  fi
  zle reset-prompt
}

autoload -Uz add-zle-hook-widget
add-zle-hook-widget line-pre-redraw starship_visual_indicator

# Let Starship display the aws-sso role credential expiry.
[[ -n ${AWS_SSO_SESSION_EXPIRATION:-} ]] &&
  export AWS_SESSION_EXPIRATION="$AWS_SSO_SESSION_EXPIRATION"
