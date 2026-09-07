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
- https://wooshy.app/
- https://www.xnview.com/en/
- https://blyt.net/phxslides/

`brew list -1`




```
zsh-autosuggestions
zsh-syntax-highlighting
tailscale
tldr
gh
fzf
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

# faster nvm
fnm 
jq
yq

# replacement for ps written in Rust
procs
# for quick navigation
zoxide
# for hashing commands
coreutils
ncdu
watch

# migrate to https://github.com/starship/starship?

# https://departuremono.com/
font-departure-mono
# json/logfmt logs formatter https://github.com/pamburus/hl
hl
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

- edit git config

# k8s
- https://krew.sigs.k8s.io/docs/user-guide/setup/install/
- `k krew install tree`
- `k krew install access-matrix`

### m1

```
softwareupdate --install-rosetta
export PATH=/usr/local/bin:$PATH
brew install qmk/qmk/qmk
brew tap homebrew/cask-drivers
brew install --cask qmk-toolbox
```

### Fun soft
- https://objective-see.org/products/knockknock.html

### Additionally

- https://github.com/ben-manes/gradle-versions-plugin



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