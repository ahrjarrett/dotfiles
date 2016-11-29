execute pathogen#infect()

set nocompatible
set number
set ruler
set softtabstop=2
set shiftwidth=2
set expandtab
set tabstop=2
set autoindent

syntax enable
colorscheme default

" Remove trailling whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e
