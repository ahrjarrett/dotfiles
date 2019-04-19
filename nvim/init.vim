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
"" allow buffers to be in the bg even if unsaved:
set hidden
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

let mapleader="\<SPACE>"
"" return to last file opened
nmap <Leader><Leader> <c-^>
"" source vim settings with <SPC> & Ctrl+Q
nmap <Leader><C-Q> :source $MYVIMRC<CR>
nmap <Leader>vi :edit ~/code/dotfiles/nvim/init.vim<CR>
" delete buffer without killing window
"nmap <Leader>bq :bp|bd<CR>
nmap <Leader>wj <C-W>j<CR>
nmap <Leader>wk <C-W>k<CR>
nmap <Leader>wh <C-W>h<CR>
nmap <Leader>wl <C-W>l<CR>
nmap <Leader>wJ <C-W>J<CR>
nmap <Leader>wK <C-W>K<CR>
nmap <Leader>wH <C-W>H<CR>
nmap <Leader>wL <C-W>L<CR>
nmap <Leader>ws <C-W>s<CR>
nmap <Leader>wv <C-W>v<CR>
nmap <Leader>wq :close<CR>
nmap <Leader>fs :w<CR>

"" arrow keys adjust panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

"" use \c-j to jump, instead of \c-o
nnoremap <C-J> <C-O>

nnoremap <SPACE> <Nop>
nnoremap ; <Nop>
nnoremap , <Nop>

"" Emacs commands
nmap <C-X><C-S> :w<CR>
"" \c-g as escape not working UGH
nmap <C-G> <Esc>
imap <C-G> <Esc>
vmap <C-G> <Esc>
map <C-G> <Esc>

"" fzf
let $FZF_DEFAULT_COMMAND = 'ag --nocolor -H -g "" 2>/dev/null'
let g:fzf_buffers_jump = 1
nmap <Leader><Tab> <plug>(fzf-maps-n)
vmap <Leader><Tab> <plug>(fzf-maps-x)
nmap <C-O> :Files!<CR>
nmap <C-S> :Lines!<CR>
nmap <Leader>ff :Files!<CR>
nmap <Leader>ww :Windows<CR>
nmap <Leader>bb :Buffers<CR>
nmap <Leader>tt :Colors<CR>
nmap <Leader>cc :Commands<CR>
nmap <Leader>gc :Commits<CR>


command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

