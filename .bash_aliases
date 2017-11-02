# ls aliases
alias ls='ls -G'
alias ll='ls -lah'

# tree aliaces
alias tree="find . -maxdepth 3 -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# git aliaces
alias gtree='git log --graph --full-history --all --color --pretty=format:"%x1b[33m%h%x09%x09%x1b[32m%d%x1b[0m %x1b[34m%an%x1b[0m   %s" "$@"'

#timestamp
alias ts='date +%s'

# other
div() {
	local columns=$(($(tput cols) - 8))
	local line=$(printf '%0.1s' "-"{1..500})
	printf "\e[01;31m---- 8< ${line:0:${columns}}\e[0m\n"
}
