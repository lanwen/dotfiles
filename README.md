# home
Some useful things for laptop

## New setup

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### mise

Global tool versions are tracked in `.config/mise/config.toml`.
From this repository's root, restore them with:

```sh
brew install mise
mkdir -p ~/.config/mise
cp .config/mise/config.toml ~/.config/mise/config.toml
mise install --cd ~
```

The tracked `.zshrc` includes mise activation. Add the following to your
`~/.zshrc` if you are not using it:

```sh
eval "$(/opt/homebrew/bin/mise activate zsh)"
```

Open a new terminal after updating your shell configuration.

### Ghostty

The Ghostty configuration is tracked in `.config/ghostty/config.ghostty`.
From this repository's root, restore it on macOS with:

```sh
brew install --cask ghostty font-fira-code-nerd-font
mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
cp .config/ghostty/config.ghostty "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"
```

Reload Ghostty's configuration or restart it to apply changes.

Appstore & Co
- https://apps.apple.com/de/app/xcode/id497799835?l=en&mt=12
- https://developer.apple.com/download/all/?q=Additional%20Tools ("Additional Tools for Xcode 12" contains Network Link Conditioner to test unstable networks)


`brew list -1`


```
zsh-autosuggestions
zsh-syntax-highlighting
tailscale
tldr
gh
fzf
ripgrep # rg: fast text search
bat # file viewer with syntax highlighting
eza # ls alternative; ll and lt aliases
dust # du alternative
duf # df alternative
superfile
pstree
psgrep

#k8s related
kubectl
eksctl
k9s
awscli
kubie # better kubectx
kubecolor # https://kubecolor.github.io/
fnm # faster nvm
jq
yq
procs # replacement for ps written in Rust
zoxide # for quick navigation
coreutils # for hashing commands
ncdu
watch
mosh
bruno

# migrate to https://github.com/starship/starship?

# https://departuremono.com/
font-departure-mono
hl # json/logfmt logs formatter https://github.com/pamburus/hl
font-fira-code-nerd-font
jetbrains-toolbox
keepingyouawake
raycast
docker
licecap
# nice stats in the tray area
stats
vlc
firefox
telegram
slack
microsoft-remote-desktop
# https://github.com/KartikLabhshetwar/better-shot screenshots
bettershot
mitmproxy
```

## From sources?

- https://github.com/marktext/marktext
- https://github.com/pluk-inc/markdown-preview

## Special
```
# for `chdman` https://retropie.org.uk/docs/CHD-files/#creating-chds-from-cd-roms
rom-tools

kap
steam
discord

jordond/tap/jolt # battery TUI
# https://github.com/slimtoolkit/slim - make docker images slim
docker-slim
# https://github.com/emanuele-em/proxelar - mitm proxy
proxelar
```

after: 

```
git config --global user.email 1964214+lanwen@users.noreply.github.com

```

- https://github.com/chrstphrknwtn/epoch-flip-clock-screensaver then `xattr -c Epoch\ Flip\ Clock.saver` also hot corner and enable pwd requirement immediately in privacy settings
- https://www.yubico.com/blog/github-now-supports-ssh-security-keys/ for ssh
- https://github.com/maxgoedjen/secretive
- https://www.josean.com/posts/how-to-use-yazi-file-manager

### GPG
- https://github.com/pstadler/keybase-gpg-github
- https://github.com/jorgelbg/pinentry-touchid

```
git config --global gpg.program "$(which gpg)"
echo "no-tty" >> ~/.gnupg/gpg.conf
```



### Yubikey

#### Disable popup
https://support.yubico.com/hc/en-us/articles/360016649059-Using-Your-YubiKey-as-a-Smart-Card-in-macOS
`sc_auth pairing_ui -s disable`

- `cd ~/.gnupg`
- https://github.com/drduh/YubiKey-Guide#create-configuration
- `curl -o gpg-agent.conf https://raw.githubusercontent.com/drduh/config/master/gpg-agent.conf`
- https://github.com/drduh/YubiKey-Guide#using-keys
- `curl -o gpg.conf https://raw.githubusercontent.com/drduh/config/master/gpg.conf ; chmod 600 gpg.conf`
- `gpg --card-status | grep sec#` should show sec key, needed in git later
- check signing with `echo "test message string" | gpg --armor --clearsign > signed.txt`


# k8s
- https://krew.sigs.k8s.io/docs/user-guide/setup/install/
- `k krew install tree`
- `k krew install access-matrix`


### kb

```
softwareupdate --install-rosetta
export PATH=/usr/local/bin:$PATH
brew install qmk/qmk/qmk
brew tap homebrew/cask-drivers
brew install --cask qmk-toolbox
```

### Fun soft
- https://objective-see.org/products/knockknock.html
- https://wooshy.app/

- https://www.xnview.com/en/
- https://blyt.net/phxslides/




### Old

```
git
go
gpg
openssh
zsh
yubikey-personalization 
hopenpgp-tools 
ykman
pinentry-mac
node
zellij
cyberduck #scp
#https://www.josean.com/posts/how-to-use-yazi-file-manager
yazi
kubeseal
keybase
gpg-suite
graphviz
grpcurl
# ping via http to understand how long it takes to connect
httping
brew tap jorgelbg/tap
# https://github.com/jorgelbg/pinentry-touchid - for gpg passhphrase with touchID
pinentry-touchid
# emulator
qemu
# https://github.com/gokcehan/lf - super nice file nav
lf
```


## AI

```
curl -fsSL https://codedb.codegraff.com/install.sh | bash
curl -fsSL https://raw.githubusercontent.com/colbymchenry/codegraph/main/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash -s -- --ui
```

