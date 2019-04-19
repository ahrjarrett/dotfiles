set nocompatible
syntax enable

"" use regular shell instead of fish inside vim
if &shell =~# 'fish$'
	set shell=sh
endif

set number
set ruler
set paste
set nowrap
set softtabstop=2
set shiftwidth=2
set expandtab
set tabstop=2
set autoindent
"" turn off annoying bells
set noerrorbells visualbell t_vb=
"" commandmode settings; better completion, etc.
set wildmenu
set showcmd
"" search settings
set hlsearch
set ignorecase
set smartcase
"" show filename at bottom
set ls=2
"" use system clipboard by default
set clipboard=unnamedplus
"" enable mouse bc lazy
set mouse=a

"" Remove trailling whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

"" install vim-plug for minimal pkg mgmt: https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'junegunn/vim-plug'
Plug 'dag/vim-fish'
"" themes
Plug 'morhetz/gruvbox'
Plug 'jdsimcoe/abstract.vim'
Plug 'tlhr/anderson.vim'
Plug 'liuchengxu/space-vim-dark'
call plug#end()

colorscheme gruvbox
set termguicolors

"" vim-fish -> https://github.com/dag/vim-fish
"" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish
"" Set this to have long lines wrap inside comments.
autocmd FileType fish setlocal textwidth=79
"" Enable folding of block structures in fish.
autocmd FileType fish setlocal foldmethod=expr
"" add vim fish to vim runtime path manually (see readme in .vim)
set runtimepath^=$HOME/.vim/bundle/vim-fish

