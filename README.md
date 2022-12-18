# home
Some useful things for laptop


```
brew install bash-completion
```


```
export PROJECTS_DIR=prj
ln -s $PROJECTS_DIR/dotfiles/.bash_env .bash_env
ln -s $PROJECTS_DIR/dotfiles/.bash_profile .bash_profile
ln -s $PROJECTS_DIR/dotfiles/.bash_aliases .bash_aliases
ln -s $PROJECTS_DIR/dotfiles/.gitconfig .gitconfig
```


## For docker

```
curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > /usr/local/etc/bash_completion.d/docker
```


## New setup

- brew
- slack in appstore
- firefox directly
- telegram directly
- https://sdkman.io/install
- https://www.elgato.com/en/epoccam (?)

Appstore & Co
- https://apps.apple.com/de/app/xcode/id497799835?l=en&mt=12
- https://developer.apple.com/download/all/?q=Additional%20Tools ("Additional Tools for Xcode 12" contains Network Link Conditioner to test unstable networks)
- https://apps.apple.com/de/app/tailscale/id1475387142?l=en&mt=12
- https://wooshy.app/

`brew list -1`

```
==> Formulae
git
go
gpg
openssh
powerlevel10k
tldr
zsh
zsh-autosuggestions
zsh-syntax-highlighting
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
exa #ls alternative
jq
yq
gping
procs
zoxide
coreutils
ncdu
watch
graphviz
grpccurl
httping


==> Casks
postman
font-fira-code-nerd-font
iterm2
jetbrains-toolbox
keepingyouawake
raycast
steam
visual-studio-code
keybase
gpg-suite
yandex-disk
google-cloud-sdk
discord
docker
licecap
kap
stats
vlc
```

- https://github.com/chrstphrknwtn/epoch-flip-clock-screensaver then `xattr -c Epoch\ Flip\ Clock.saver` also hot corner and enable pwd requirement immediately in privacy settings
- https://www.yubico.com/blog/github-now-supports-ssh-security-keys/ for ssh


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
