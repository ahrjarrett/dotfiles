execute pathogen#infect()

set nocompatible
set number
set ruler
set paste
set nowrap
set softtabstop=2
set shiftwidth=2
set expandtab
set tabstop=2
set autoindent
set noerrorbells visualbell t_vb= "turn off annoying bells
syntax enable
colorscheme koehler

" Remove trailling whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e
