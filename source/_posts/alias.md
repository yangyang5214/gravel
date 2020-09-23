---
title: alias
tags: [alias,sh,tools]
date: 2020-08-11 10:05:52
---


https://github.com/sharkdp/bat


### alias

```
alias cat='bat'
alias cp='cp -v'
alias mv='mv -v'
alias grep="grep --color"
alias mkdir="mkdir -pv"
alias df="df -h"
alias du="du -h"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias tf='tail -f'
alias d='date +"%Y-%m-%d"'
alias dt='date +"%Y-%m-%d %H:%M:%S"'
alias ds='date +"%s"'

```

### sh


.bashrc file

```
if [ -f ~/.bash_aliases_beer ]; then
. ~/.bash_aliases
fi
```

source .bashrc


### timezone

```
sudo timedatectl set-timezone 'Asia/Shanghai'
```

