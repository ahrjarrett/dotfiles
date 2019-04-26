
" Dotfiles: https://github.com/ahrjarrett/dotfiles {{{
  " Author: Andrew Jarrett 
" }}}

" Dein: {{{
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('wsdjeg/dein-ui.vim') " very simliar to Plug UI
  call dein#add('Shougo/context_filetype.vim')
  call dein#add('Shougo/defx.nvim')
" }}}
" Denite: {{{
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim') "python3 -m pip install --user --upgrade pynvim
  call dein#add('raghur/fruzzy', {'hook_post_update': 'call fruzzy#install()'})
	call dein#add('neoclide/denite-extra')
  call dein#add('Shougo/neomru.vim')
" }}}
" Navigation: {{{
  call dein#add('lambdalisue/fila.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('tpope/vim-surround')
" UI: {{{
  call dein#add('Yggdroot/indentLine')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
" }}}
" Themes: {{{
  call dein#add('rakr/vim-one')
  call dein#add('morhetz/gruvbox')
  call dein#add('patstockwell/vim-monokai-tasty')
  call dein#add('jdsimcoe/abstract.vim')
  call dein#add('tlhr/anderson.vim')
  call dein#add('mhartington/oceanic-next')
  call dein#add('NLKNguyen/papercolor-theme')
" }}}
" TypeScript: {{{
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
" }}}
  call dein#add('ryanoasis/vim-devicons')
  call dein#end()
  call dein#save_state() " not sure why we have to do this part?
  filetype plugin indent on
" }}}

" System Settings:  ----------------------------------------------------------{{{
  set termguicolors
  set mouse=a
  set nowrap
  set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
  set clipboard+=unnamedplus
  " Better search defaults:
  set hlsearch
  set ignorecase
  set smartcase
  filetype on
  set number
  set numberwidth=1
  set tabstop=2 shiftwidth=2 expandtab
  set shiftwidth=2
  set conceallevel=0
  set hidden
  set autoindent
  set noerrorbells visualbell t_vb=
  set laststatus=2
  set conceallevel=0
  set wildmenu
  set wildmode=full
  set wildignore=*~,.git,node_modules
  set autoread
  set updatetime=500
  set fillchars+=vert:│
  let mapleader="\<SPACE>"
  let maplocalleader=","
" Open command mode with just semicolon!
  nnoremap ; :
  nnoremap <SPACE> <Nop>

  set undofile
  set undodir="$HOME/.VIM_UNDO_FILES"
  " Remember cursor position between vim sessions:
  autocmd BufReadPost *
          \ if line("'\"") > 0 && line ("'\"") <= line("$") |
          \   exe "normal! g'\"" |
          \ endif
  set complete=.,w,b,u,t,k " CTRL-P completion: where to source
  set inccommand=nosplit   " enable live substitution highlighting - http://vimcasts.org/transcripts/73/en
  set spell
  let g:indentLine_color_gui = '#343d46'

" Clipboard Stuff:
  let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }

  " Copy current file path to clipboard:
  nmap cp :let @+= expand("%") <cr>
	" Copy to osx clipboard:
  vnoremap <C-c> "*y<CR>
  vnoremap y "*y<CR>
  noremap Y y$
  vnoremap y myy`y
  vnoremap Y myY`y
" }}}

" System Mappings:  ----------------------------------------------------------{{{
  " Disable linewise keys when lines wrap
  nmap j gj
  nmap k gk
  " No need for ex mode
  nnoremap Q <nop>
  " Turn off macros until I have time to figure them out
  map q <Nop>
  " Align blocks of text and keep them selected
  vmap < <gv
  vmap > >gv

" Leader Key:
  " Return to last file/buffer:
  nmap <Leader><Leader> <c-^>
  " Source vimrc with C-Q:
  nmap <C-q> :source $MYVIMRC<CR>
  tmap <leader>x <C-\><C-n>:bp! <BAR> bd! #<CR>
  tmap <leader>. <C-\><C-n>:bnext<CR>
  tmap <leader>, <C-\><C-n>:bprevious<CR>
  nmap <silent><Leader>. :bnext<CR>
  nmap <silent><Leader>, :bprevious<CR>
  nmap <Leader>bd :bd <C-^><CR>
  nmap <Leader>wq :close<CR>
  nmap <Leader>fs :w<CR>
  nmap <Leader>qq :qa<CR>
  nmap <Leader>wj <C-w>j
  nmap <Leader>wk <C-w>k
  nmap <Leader>wh <C-w>h
  nmap <Leader>wl <C-w>l
  nmap <Leader>wJ <C-w>J
  nmap <Leader>wK <C-w>K
  nmap <Leader>wH <C-w>H
  nmap <Leader>wL <C-w>L
  nmap <Leader>ws <C-w>s
  nmap <Leader>wv <C-w>v


" Alt Key:
  imap <A-bs> <C-w>
  imap <A-left> <C-o>b
  imap <A-right> <Esc>ea
  cmap <A-bs> <C-w>
  nmap <A-v> :edit $MYVIMRC<CR>
  nmap <A-e> :Explore<CR>
  nmap <A-/> :noh<CR>
  imap <A-/> <Esc>:noh<CR>a
  " Window mechanics:
  nmap <A-j> <C-w>j
  nmap <A-k> <C-w>k
  nmap <A-h> <C-w>h
  nmap <A-l> <C-w>l
  nmap <A-\> <C-w>v
  nmap <A--> <C-w>s
  nmap <A-S-j> <C-w>J
  nmap <A-S-k> <C-w>K
  nmap <A-S-h> <C-w>H
  nmap <A-S-l> <C-w>L
  tnoremap <A-/> <C-\><C-n>:noh<CR>A
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  "" Alt+Up :: jump to prev terminal command (~@)
  tnoremap <A-up> <C-\><C-n>0?^\~@.*$<CR>
  tnoremap <A-down> <C-\><C-n>$/^\~@☭ .*$<CR>
  nnoremap <A-up> <C-\><C-n>0?^\~@.*$<CR>
  nnoremap <A-down> <C-\><C-n>$/^\~@.*$<CR>

" Mappings Miscellany:
  nnoremap <Left>  :vertical resize -1<CR>
  nnoremap <Right> :vertical resize +1<CR>
  nnoremap <Up>    :resize -1<CR>
  nnoremap <Down>  :resize +1<CR>
  " Support Emacs muscle-memory:
  nmap <C-x><C-s> :w<CR>
  map <C-g> <Esc>
  nmap <C-g> <Esc>
  imap <C-g> <Esc>
  vmap <C-g> <Esc>
  cmap <C-g> <Esc>
  " Use C-j to jump (instead of C-o, used for FZF):
  nnoremap <C-j> <C-o>
" }}}

" Code formatting: -----------------------------------------------------------{{{
" }}}

" Nvim Terminal: -------------------------------------------------------------{{{
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  autocmd BufEnter term://* startinsert
  autocmd TermOpen * set bufhidden=hide

  " Use fish shell (buggy at times):
  if &shell =~# 'fish$'
    set shell=sh
  endif
" }}}

" Themes, Commands, etc: ------------------------------------------------------{{{
  syntax on
  let g:one_allow_italics = 1
  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
  let g:vim_monokai_tasty_italic = 1
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_italic='1'
  let g:gruvbox_bold='1'
  let g:gruvbox_underline='1'
  let g:gruvbox_undercurl='1'
  let g:gruvbox_italicize_comments='1'
  let g:gruvbox_contrast_dark='hard'

  "colorscheme OceanicNext
  colorscheme gruvbox
  let g:airline_theme='oceanicnext'
  "let g:airline_theme='onedark'
" }}}

" Airline: --------------==-----------------------------------------------------{{{
  let g:airline_powerline_fonts = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
" Import custom Airline functions/namespace:
  if !exists('getrepodata#GetRemoteRepo')
    runtime plugin/getrepodata.vim
  endif

  " 0 = full branch; 1 = tail (foo/bar => bar); 2 = truncate (foo/bar => f/bar)
  let g:airline#extensions#branch#format = 0
  let g:airline#extensions#tabline#enabled=1
  let g:webdevicons_enable_airline_statusline=1
  let g:webdevicons_enable_airline_tabline = 1
  let g:airline#extensions#hunks#enabled = 0
  let g:airline#extensions#wordcount#enabled = 0
  let g:airline#extensions#whitespace#enabled = 0

  let g:airline#extensions#tabline#formatter = 'unique_tail'
  " Inactive windows' left section collapsed to just buffer filename
  let g:airline_inactive_collapse=1
  let g:airline#ignore_bufadd_pat = 'undotree|vimfiler|tagbar|startify|!'
  let g:airline_skip_empty_sections = 1
  let g:airline_statusline_ontop = 0
  
  function! MakeBranch()
    let l:branch = g:airline_symbols.branch .' '. getrepodata#GetBranch() . g:airline_symbols.dirty
    return l:branch
  endfunction

  call airline#parts#define_function('git_local', 'getrepodata#GetLocalRepo')
  call airline#parts#define_function('git_remote', 'getrepodata#GetRemoteRepo')
  call airline#parts#define_function('git_branch', 'MakeBranch')


  function! AirlineInit()
    let g:airline_section_a = airline#section#create(["mode"])
    let g:airline_section_b = airline#section#create(["git_branch"])
    let g:airline_section_c = airline#section#create(["⎇' ", "git_remote"])
    let g:airline_section_x = airline#section#create_right(["git_local"])
    let g:airline_section_y = ''
    let g:airline_section_z = ''
    "call airline#parts#define_accent('git_branch', 'orange')
  endfunction
  autocmd VimEnter * call AirlineInit()

  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.dirty=' ⚡'

  let g:airline_mode_map = {
    \ '__' : '? -',
    \ 'c'  : '♞ C',
    \ 'i'  : '✎ I',
    \ 'ic' : '✏︎ I',
    \ 'ix' : '✐ I',
    \ 'n'  : '♜ N',
    \ 'ni' : '♜ N',
    \ 'no' : '♖ N',
    \ 'R'  : '✁ R',
    \ 'Rv' : '✂︎ R',
    \ 's'  : '♙ S',
    \ 'S'  : '♙ S',
    \ 't'  : '♚ T',
    \ 'v'  : '✄ V',
    \ 'V'  : '✁ V',
    \ ' '  : '✂︎ V',
    \ }

" Airline Mappings:
  " Glide through Buffer tabs like Browser tabs:
  nmap <silent><A-}> :bnext<CR>
  nmap <silent><A-{> :bprevious<CR>
  tmap <A-}> <C-\><C-n>:bnext<CR>
  tmap <A-{> <C-\><C-n>:previous<CR>
  inoremap <silent><A-}> <Esc>:bnext<CR>
  inoremap <silent><A-{> <Esc>:bprevious<CR>
" }}}

" Vim-Devicons: --------------------------------------------------------------{{{
  let g:webdevicons_enable_denite = 0
  let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:WebDevIconsOS = 'Darwin'
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tsx'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sql'] = ''

" }}}

" Deoplete: ------------------------------------------------------------------{{{

  "    " **** I don't know what any of this section does yet. ****
  "    " enable deoplete
  "    let g:deoplete#enable_at_startup = 1
  "    let g:deoplete#auto_complete_delay = 0
  "    let g:echodoc_enable_at_startup=1
  "    let g:echodoc#type="virtual"
  "    set splitbelow
  "    set completeopt+=menuone,noinsert,noselect
  "    set completeopt-=preview
  "    autocmd CompleteDone * pclose

  "    function! Multiple_cursors_before()
  "    	let b:deoplete_disable_auto_complete=2
  "    endfunction
  "    function! Multiple_cursors_after()
  "    	let b:deoplete_disable_auto_complete=0
  "    endfunction
  "    let g:deoplete#file#enable_buffer_path=1
  "    function! Preview_func()
  "    	if &pvw
  "    		setlocal nonumber norelativenumber
  "    	endif
  "    endfunction
  "    autocmd WinEnter * call Preview_func()
  "    let g:deoplete#ignore_sources = {'_': ['around', 'buffer', 'member' ]}

" }}}
" Denite: --------------------------------------------------------------------{{{

  " TODO: 
    " 1. "Find CTags": Build <C-f> search that builds & searches for CTags at cursor
    " 2. "Ctrl P": Fix completion -- C-p seems to be broken:
      "nnoremap <silent> <C-p> :Denite file/rec<CR>
    " 3. "Yank File": Find file by title OR contents, pipe file's conetnts to pbcopy
      "noremap<Leader>yf :Denite file -auto-action=preview -default-action=yank_to_default_register<CR>
    " 4. Figure out how to get everything on the same leaderkey / namespace?

  let s:menus = {}
  call denite#custom#option('_', {
        \ 'prompt': '❯',
        \ 'winheight': 10,
        \ 'updatetime': 1,
        \ 'auto_resize': 0,
        \ 'highlight_matched_char': 'Underlined',
        \ 'highlight_mode_normal': 'CursorLine',
        \ 'reversed': 1,
        \ 'auto-accel': 1,
        \})

  call denite#custom#option('TSDocumentSymbol', {
        \ 'prompt': ' @' ,
        \})
  call denite#custom#option('TSWorkspaceSymbol', {
        \ 'prompt': ' #' ,
        \})

  call denite#custom#source('file/rec', 'vars', {
        \'command': ['ag', '--follow','--nogroup','--hidden', '--column', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'node_modules'],
        \'matchers': ['matcher/fruzzy'],
        \'sorters':['sorter_sublime'],
        \})
  let fruzzy#usenative = 1
  
  call denite#custom#source('grep', 'vars', {
         \'command': ['ag'],
         \'default_opts': ['-i', '--vimgrep'],
         \'recursive_opts': [],
         \'pattern_opt': [],
         \'separator': ['--'],
         \'final_opts': [],
         \'matchers': ['matcher/ignore_globs', 'matcher/regexp', 'matcher/pyfuzzy']
         \})
  nnoremap <C-s> :Denite file/rec line -default-action=split<CR>
  noremap<C-o> :Denite file -auto-action=preview -default-action=open<CR>
  noremap<Leader>1 :DeniteCursorWord help<CR>
	call denite#custom#map(
	      \ 'insert',
	      \ '<C-g>',
	      \ '<denite:quit><CR>',
	      \ 'noremap'
	      \)

  call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
" }}}

