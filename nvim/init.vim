set nocompatible
syntax enable

"" use regular shell inside vim (instead of fish)
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
"" don't hide chars from me
set conceallevel=1

"" Remove trailling whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with
" line wrapping on, this can cause the cursor to actually skip a few lines on the screen because
" it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down'
" to mean the next line on the screen
nmap j gj
nmap k gk

"" install vim-plug for minimal pkg mgmt: https://github.com/junegunn/vim-plug
if empty(glob('~/code/dotfiles/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/code/dotfiles/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/code/dotfiles/nvim/bundle')
Plug 'junegunn/vim-plug'
Plug 'dag/vim-fish'
Plug 'tpope/vim-rails'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/unite.vim' " remove, unless you're using? seems /expensive/
"" themes
Plug 'morhetz/gruvbox'
Plug 'jdsimcoe/abstract.vim'
Plug 'tlhr/anderson.vim'
Plug 'liuchengxu/space-vim-dark'
call plug#end()

set rtp+=/usr/local/bin/fzf

colorscheme gruvbox
set termguicolors

"" vim-fish -> https://github.com/dag/vim-fish
"" Set up :make to use fish for syntax checking.
autocmd FileType fish compiler fish
"" Set this to have long lines wrap inside comments.
autocmd FileType fish setlocal textwidth=79
"" Enable folding of block structures in fish.
autocmd FileType fish setlocal foldmethod=expr

"" arrow keys adjust panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

"" use \c-j to jump, instead of \c-o
:nnoremap <C-J> <C-O>
:nmap <C-O> :GitFiles!<CR>

let mapleader="\<SPACE>"
"" return to last file opened
nmap <Leader><Leader> <c-^>
"" source vim settings with <SPC> & Ctrl+Q
nmap <Leader><C-Q> :source $MYVIMRC<CR>
nmap <Leader><Tab> <plug>(fzf-maps-n)
xmap <Leader><Tab> <plug>(fzf-maps-x)
nmap <Leader>fb :Buffers<CR>
nmap <Leader>ff :GitFiles!<CR>
nmap <Leader>fc :Commands<CR>

"" fzf
"nmap <Leader>s <plug>(fzf-buffers)
"let g:fzf_buffers_jump = 1
"" broken stuff
"nmap <Leader>s :FZF <C-R><C-W>
"command! -bang MyStuff
"  \ call fzf#run(fzf#wrap('code', {'dir': '~/code'}, <bang>0))
"fzf --bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'
