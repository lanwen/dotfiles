# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /Users/lanwen/.config/broot/launcher/bash/br
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

random-string()
{
    cat /dev/urandom | env LC_CTYPE=C env LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n ${1:-1}
}

# Secretive Config
export SSH_AUTH_SOCK=/Users/lanwen/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH=$PATH:$GOPATH/bin
