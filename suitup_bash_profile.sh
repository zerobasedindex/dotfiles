#!/bin/bash

export PS1="\W$ "

# export CLICOLOR=1
# export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# Enable bash completion for git commands/branches
# source /usr/local/etc/bash_completion
# source /usr/local/etc/bash_completion.d/git-completion.bash

alias ls='ls -G'
alias gs='git status'

killpick() {
	kill $(ps -e | awk '{if(NR!=1) { print $4, $1 }}' | pick -do | tail -n +2)
}

gsb() {
	git checkout $(git branch | cut -c 3- | pick)
}

cdsub() {
	cd $(find . -type d | pick)
}