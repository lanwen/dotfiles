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
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /usr/local/etc/bash_completion.d/docker-compose
```

```
curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > /usr/local/etc/bash_completion.d/docker
```
