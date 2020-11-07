---
title: vim plug
tags: [vim plug,tools]
---

[GitHub - junegunn/vim-plug: Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)

### create .vimrc

touch ~/.vimrc

### add  vim-plug

```shell script
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
``` 

```shell script
call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
```

### PlugInstall

in .vimrc file

:PlugInstall


