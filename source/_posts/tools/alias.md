---
title: alias
tags: [linux,alias,tools]
---

https://github.com/sharkdp/bat

### alias

```shell script
alias cp='cp -v'
alias mv='mv -v'
alias grep="grep --color"
alias mkdir="mkdir -pv"
alias ll='ls -lht'
alias df="df -h"
alias du="du -h"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias tf='tail -f'
alias d='date +"%Y-%m-%d"'
alias dt='date +"%Y-%m-%d %H:%M:%S"'
alias ds='date +"%s"'

alias gpp='git pull --rebase && git push'
alias gp='git pull'
alias gb='git branch'
alias gs='git status'
alias gm='git commit -m'
alias openc='open -a "Google Chrome"'
```

### sh


.bashrc file

```shell script
if [ -f ~/.bash_aliases_beer ]; then
    . ~/.bash_aliases
fi
```

source .bashrc


### timezone

```shell script
sudo timedatectl set-timezone 'Asia/Shanghai'
```

### vim

vim ~/.vimrc

```shell script
syntax on	
set number 
set cindent
set smartindent 
set showmatch 
set ruler 
set mouse=a 
```