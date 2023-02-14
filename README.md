# home
Some useful things for laptop

## New setup

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- brew
- https://sdkman.io/install

Appstore & Co
- https://apps.apple.com/de/app/xcode/id497799835?l=en&mt=12
- https://developer.apple.com/download/all/?q=Additional%20Tools ("Additional Tools for Xcode 12" contains Network Link Conditioner to test unstable networks)
- https://apps.apple.com/de/app/tailscale/id1475387142?l=en&mt=12
- https://wooshy.app/

`brew list -1`


`brew tap jorgelbg/tap`

```
==> Formulae
git
go
gpg
openssh
zsh
zsh-autosuggestions
zsh-syntax-highlighting
# input prompt for zsh
powerlevel10k
tldr
yubikey-personalization 
hopenpgp-tools 
ykman
pinentry-mac
node
gh
kubectl
kubectx
fzf
skaffold
k9s
awscli
kubeseal
#ls alternative
exa 
jq
# like jq, but for yaml
yq
# nice graph when pinging
gping
# replacement for ps written in Rust
procs
# for quick navigation
zoxide
# for hashing commands
coreutils
ncdu
watch
graphviz
# to test grpc
grpccurl
# ping via http to understand how long it takes to connect
httping
# ssh keys with touchID
secretive
# https://github.com/jorgelbg/pinentry-touchid - for gpg passhphrase with touchID
pinentry-touchid
# emulator
qemu
# for `chdman` https://retropie.org.uk/docs/CHD-files/#creating-chds-from-cd-roms
rom-tools
# https://github.com/gokcehan/lf - super nice file nav
lf


brew tap homebrew/cask-fonts

==> Casks
font-fira-code-nerd-font
iterm2
jetbrains-toolbox
keepingyouawake
raycast
visual-studio-code
keybase
gpg-suite
yandex-disk
google-cloud-sdk
docker
licecap
# nice stats in the tray area
stats
vlc
firefox
telegram
slack
microsoft-remote-desktop

# optional
kap
postman
steam
discord
```

- https://github.com/chrstphrknwtn/epoch-flip-clock-screensaver then `xattr -c Epoch\ Flip\ Clock.saver` also hot corner and enable pwd requirement immediately in privacy settings
- https://www.yubico.com/blog/github-now-supports-ssh-security-keys/ for ssh

### GPG
- https://github.com/pstadler/keybase-gpg-github
- https://github.com/jorgelbg/pinentry-touchid

### Aliases
```
cd=z
k=kubectl
ll='exa -la'
ls=exa
ping=gping
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

- edit git config

# k8s
- https://krew.sigs.k8s.io/docs/user-guide/setup/install/
- `k krew install tree`
- `k krew install access-matrix`

### m1

```
softwareupdate --install-rosetta
arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/usr/local/bin:$PATH
brew install qmk/qmk/qmk
brew tap homebrew/cask-drivers
brew install --cask qmk-toolbox
```
