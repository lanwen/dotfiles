##############################
#
# Development tools (mise)
#
##############################
eval "$(/opt/homebrew/bin/mise activate zsh)"

##############################
#
# Completion setup
#
# Initialize completion, including Docker, before plugins wrap its widgets.
#
##############################
fpath=(/Users/lanwen/.docker/completions $fpath)
autoload -Uz compinit
compinit

##############################
#
# fzf completion menu and previews
#
##############################
source <(fzf --zsh)
source "/opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"
zstyle ':completion:*' menu no
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' fzf-flags '--height=60%' '--layout=reverse' '--border' \
  '--preview-window=right:55%:wrap'
# Preview directory names and sizes with eza, and file contents with bat.
zstyle ':fzf-tab:complete:*:*' fzf-preview '
  target=${(Q)realpath}
  if [[ -d $target ]]; then
    eza -lah --group-directories-first --no-permissions --no-user --no-time \
      --color=always --icons -- "$target"
  elif [[ -f $target ]]; then
    bat --color=always --style=numbers --paging=never --line-range=:200 \
      -- "$target"
  else
    print -r -- "$desc"
  fi
'
# Preview command examples, then the manual, then the command location.
zstyle ':fzf-tab:complete:-command-:*' fzf-preview '
  if preview_text=$(tldr --color "$word" 2>/dev/null); then
    print -r -- "$preview_text"
  elif preview_text=$(
    MANPAGER=cat MANWIDTH=${FZF_PREVIEW_COLUMNS:-80} man "$word" 2>/dev/null
  ); then
    print -r -- "$preview_text" | col -b | \
      bat --language=man --color=always --style=plain --paging=never
  else
    whence -v -- "$word"
  fi
'

##############################
#
# Aliases
#
##############################
alias ps='procs'
alias vi='nvim'
alias eza='eza --group-directories-first' # List folders before files.
alias ll='eza -lah --git --icons'
alias lt='eza --tree --level=2 --icons'
alias tree='eza --tree --level=3 --icons'
alias ls='eza --icons'
alias du='dust'
alias df='duf'
alias tf=terraform
alias k=kubectl

##############################
#
# Editor and display preferences
#
##############################
export BAT_THEME=ansi
export EDITOR='nvim'
export VISUAL='nvim'

##############################
#
# History and filename sorting
#
##############################
HISTSIZE=5000             # Maximum number of commands kept in memory.
HISTFILE=~/.zsh_history   # File where command history is saved.
SAVEHIST=$HISTSIZE        # Maximum number of commands saved to that file.

# setopt enables an option; unsetopt disables it.
setopt sharehistory         # Save immediately; share history between sessions.
setopt hist_ignore_space    # Skip commands starting with a space.
setopt hist_ignore_all_dups  # Remove an older copy when a command is repeated.
setopt hist_save_no_dups    # Omit older duplicates when rewriting history.
setopt numeric_glob_sort   # Sort filenames naturally: file2 before file10.

##############################
#
# Deja inline suggestions
#
##############################
DEJA_CYCLE_KEY='' # Leave Tab for zsh completion instead of cycling suggestions.
DEJA_ACCEPT_KEY='^[[1;2C' # Shift+Right accepts the whole suggestion.
DEJA_CYCLE_FUZZY_KEY='' # Free Shift+Right from changing the fuzzy setting.
if [[ -r "$HOME/.local/share/deja/init.zsh" ]]; then
  source "$HOME/.local/share/deja/init.zsh"
else
  eval "$(deja init zsh)"
fi
# Prompt redraws do not edit input.
DEJA_IGNORE_WIDGETS+=(starship_visual_indicator)

##############################
#
# Vi mode and keyboard bindings
#
# Force vi mode even when EDITOR was unset at shell startup.
#
# Ghostty sends Option-Left and Option-Right in two formats.
# These bindings move by one word in vi insert mode.
#
##############################
bindkey -v
bindkey -M viins '^I' fzf-tab-complete # Tab opens the fzf completion menu.
# Up cycles suggestions; starting from an empty line browses history.
# Recalled history remains navigable.
_suggestion_up_or_history() {
  if [[ -z $BUFFER ]] || (( HISTNO < HISTCMD )); then
    zle up-line-or-history
  elif [[ -n $POSTDISPLAY ]] && (( CURSOR == ${#BUFFER} )); then
    zle deja-cycle
  fi
}
# Right accepts a fuzzy replacement in full, or one word of a normal suggestion.
_suggestion_right_or_word() {
  if [[ -n $POSTDISPLAY ]] && (( CURSOR == ${#BUFFER} )); then
    if [[ $_DEJA_SUGGESTION_MODE == fuzzy ]]; then
      zle deja-accept
    else
      zle emacs-forward-word
    fi
  else
    zle .forward-char
  fi
}
zle -N _suggestion_up_or_history
zle -N _suggestion_right_or_word
bindkey -M viins '\e[A' _suggestion_up_or_history
bindkey -M viins '\eOA' _suggestion_up_or_history
bindkey -M viins '\e[B' down-line-or-history
bindkey -M viins '\eOB' down-line-or-history
bindkey -M viins '\e[C' _suggestion_right_or_word
bindkey -M viins '\eOC' _suggestion_right_or_word
bindkey -M viins '\e[1;2C' deja-accept
bindkey -M viins '\e[1;3D' backward-word
bindkey -M viins '\e[1;3C' forward-word
bindkey -M viins '\eb' backward-word
bindkey -M viins '\ef' forward-word

##############################
#
# 1Password SSH agent and OCI authentication
#
##############################
export \
 SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

oci-auth() {
    export OCI_CLI_KEY_CONTENT="$(
      op read "op://Private/zz2fpyuhmorsssme5o4peepdoi/private key"
    )"
}

oci() {
    if [[ -z "${OCI_CLI_KEY_CONTENT:-}" ]]; then
      oci-auth
    fi

    command oci "$@"
}

##############################
#
# Directory navigation
#
##############################
eval "$(zoxide init --cmd cd zsh)"

##############################
#
# Completion colors
#
# Bold blue directories, matching eza.
#
##############################
zstyle ':completion:*' list-colors 'di=1;34'

##############################
#
# Local commands and package-manager wrappers
#
##############################
export PATH="/Users/lanwen/.local/bin:$PATH"

##############################
#
# Starship prompt and mode labels
#
##############################
if (( ! ${+functions[starship_zle-keymap-select]} )); then
  eval "$(starship init zsh)"
elif [[ ${widgets[zle-keymap-select]:-} == \
  user:starship_zle-keymap-select-wrapped ]]; then
  zle -N zle-keymap-select starship_zle-keymap-select
fi

# Expose NORMAL mode to Starship through STARSHIP_ZLE_MODE.
starship_zle-keymap-select() {
  if [[ $KEYMAP == vicmd ]]; then
    export STARSHIP_ZLE_MODE=NORMAL
  else
    unset STARSHIP_ZLE_MODE
  fi
  zle reset-prompt
}

# Display VISUAL while a selection is active; redraw when it changes.
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

autoload -Uz add-zle-hook-widget add-zsh-hook
add-zle-hook-widget line-pre-redraw starship_visual_indicator

##############################
#
# Cursor shape
#
# Use a steady block in vi normal mode and a steady beam in insert mode.
#
##############################
_zsh_cursor_shape() {
  if [[ $KEYMAP == vicmd ]]; then
    print -n -- $'\e[2 q' # 2 = steady block; 1 = blinking block.
  else
    print -n -- $'\e[6 q' # 6 = steady beam; 5 = blinking beam.
  fi
}
add-zle-hook-widget keymap-select _zsh_cursor_shape
# Keep Deja's line-init hook unwrapped to avoid recursion on reload.
add-zsh-hook precmd _zsh_cursor_shape

##############################
#
# AWS credential expiry for Starship
#
##############################
[[ -n ${AWS_SSO_SESSION_EXPIRATION:-} ]] &&
  export AWS_SESSION_EXPIRATION="$AWS_SSO_SESSION_EXPIRATION"

##############################
#
# Command syntax highlighting
#
##############################
source \
  $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
