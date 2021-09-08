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
broot
gping
procs
zoxide

==> Casks
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
- 

