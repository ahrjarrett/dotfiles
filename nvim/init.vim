set nocompatible
syntax enable

"" use regular shell inside vim (instead of fish)
if &shell =~# 'fish$'
	set shell=sh
endif

"" **** GENERAL SETTINGS ****
set number
set ruler
set nowrap
set timeoutlen=500
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
"" directories to ignore with tab completion:
set wildignore=*~,.git,node_modules
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
"enable matchit for % to jump btwn keyword pairs"
runtime macros/matchit.vim


"" **** PACKAGES ****
"" install Plug
if empty(glob('~/code/dotfiles/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/code/dotfiles/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/code/dotfiles/nvim/bundle')

"" package list
Plug 'junegunn/vim-plug'
Plug 'dag/vim-fish'
Plug 'PeterRincker/vim-searchlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'ruby', 'css', 'json', 'graphql', 'markdown', 'yaml', 'html'] }



"" themes:
Plug 'morhetz/gruvbox'
Plug 'jdsimcoe/abstract.vim'
Plug 'tlhr/anderson.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'mhartington/oceanic-next'

"" supposed to load last, for some reason
Plug 'ryanoasis/vim-devicons'
call plug#end()


"" **** LEADER & LOCAL LEADER KEYS ****
let mapleader="\<SPACE>"
let maplocalleader=";"
nnoremap <SPACE> <Nop>
nnoremap ; <Nop>
"nnoremap , <Nop>




"" **** GRUVBOX ****
let g:gruvbox_italic='1'
let g:gruvbox_bold='1'
let g:gruvbox_underline='1'
let g:gruvbox_undercurl='1'
let g:gruvbox_italicize_comments='1'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_vert_split='bg2'
"let g:gruvbox_invert_tabline='0'
"let g:gruvbox_invert_indent_guides='1'
colorscheme gruvbox
set termguicolors


"" **** AIRLINE ****
let g:airline_theme='oceanicnext'

"" This might break airline_symbols approach?
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('*getremoterepo#GetRemoteRepo')
   runtime plugin/getremoterepo.vim
endif

let g:airline#extensions#tabline#enabled=1
let g:webdevicons_enable_airline_statusline=1
let g:webdevicons_enable_airline_tabline = 1
"" 0=full branch, 1=tail (feature/foo => foo), 2=truncate (feature/foo => f/foo)
let g:airline#extensions#branch#format = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_section_a ="%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P"
"let g:airline_section_a ="%{eval Git config --get remote.origin.url}"

set laststatus=2
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline_section_a = "%{'<loading>'}"
let g:airline_section_c = "%{getcwd()}"
"" determine whether inactive windows should have the left section collapsed to only the filename of that buffer
let g:airline_inactive_collapse=1
"let g:airline_section_c = '%{:!command git remote -v}'
let g:airline_section_x = ''
" let g:airline_section_y = '%{WebDevIconsGetFileFormatSymbol()}'
let g:airline_section_y = ''
let g:airline_section_z = '%l:%c'
"let g:airline_symbols.branch = '⎇''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = '👀'
"" MIGHT NEED TO TURN THIS ON FOR FZF PERFORMANCE:
"let g:airline_exclude_preview = 0
let g:airline_skip_empty_sections = 1
let g:airline_statusline_ontop = 0
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
let g:airline_symbols.dirty='⚡'



tmap <leader>x <C-\><C-n>:bp! <BAR> bd! #<CR>
tmap <leader>. <C-\><C-n>:bnext<CR>
tmap <leader>, <C-\><C-n>:bprevious<CR>
nmap <silent><leader>. :bnext<CR>
nmap <silent><leader>, :bprevious<CR>

nmap <silent><A-}> :bnext<CR>
nmap <silent><A-{> :bprevious<CR>
tmap <A-}> <C-\><C-n>:bnext<CR>
tmap <A-{> <C-\><C-n>:previous<CR>

inoremap <silent><A-}> <Esc>:bnext<CR>
inoremap <silent><A-{> <Esc>:bprevious<CR>


"tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
"tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
"tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
"tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
"tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
"tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
"tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
"tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
"tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
"nmap <leader>1 <Plug>AirlineSelectTab1
"nmap <leader>2 <Plug>AirlineSelectTab2
"nmap <leader>3 <Plug>AirlineSelectTab3
"nmap <leader>4 <Plug>AirlineSelectTab4
"nmap <leader>5 <Plug>AirlineSelectTab5
"nmap <leader>6 <Plug>AirlineSelectTab6
"nmap <leader>7 <Plug>AirlineSelectTab7
"nmap <leader>8 <Plug>AirlineSelectTab8
"nmap <leader>9 <Plug>AirlineSelectTab9




"function! AirlineInit()
"  let g:airline_section_a = airline#section#create(['branch', 'mode'])
"  let g:airline_section_b = airline#section#create_left(['mode'])
"  "let g:airline_section_c = airline#section#create(['filetype'])
"  "let g:airline_section_d = airline#section#create(['filetype'])
"endfunction
"autocmd VimEnter * call AirlineInit()


"" **** TYPESCRIPT/TSX ****
"" pink
hi tsxTagName guifg=#E06C75 cterm=italic
"" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
"" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666
" tan
hi ReactProps guifg=#D19A66 cterm=italic
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
" aqua
hi Events ctermfg=204 guifg=#56B6C2
hi WebBrowser ctermfg=204 guifg=#56B6C2
" light purple
hi ReactState guifg=#C176A7 cterm=italic
" purple
hi ReduxKeywords ctermfg=204 guifg=#C678DD




"" **** KEY MAPPINGS ****
"" return to last file opened
nmap <Leader><Leader> <c-^>
"" source vim settings with <SPC> & Ctrl+Q
nmap <Leader><C-q> :source $MYVIMRC<CR>
nmap <Leader>vi :edit $MYVIMRC<CR>
" delete buffer without killing window
nmap <Leader>bd :bd <C-^><CR>
"nmap <Leader>wj <C-w>j
"nmap <Leader>wk <C-w>k
"nmap <Leader>wh <C-w>h
"nmap <Leader>wl <C-w>l
"nmap <Leader>wJ <C-w>J
"nmap <Leader>wK <C-w>K
"nmap <Leader>wH <C-w>H
"nmap <Leader>wL <C-w>L
"nmap <Leader>ws <C-w>s
"nmap <Leader>wv <C-w>v
nmap <Leader>wq :close<CR>
nmap <Leader>fs :w<CR>
nmap <Leader>qq :qa<CR>
nmap <Leader>/ :noh<CR>
"" LEADER FZF:
nmap <Leader><Tab> <plug>(fzf-maps-n)
vmap <Leader><Tab> <plug>(fzf-maps-x)
nmap <C-o> :Files!<CR>
"" search all from CWD with preview
nmap <C-s> :Ag!<CR>
nmap <Leader>fe :Explore<CR>
nmap <Leader>ff :Files!<CR>
"nmap <Leader>ww :Windows<CR>
nmap <Leader>bb :Buffers<CR>
nmap <Leader>tt :Colors<CR>
nmap <Leader>cc :Commands<CR>
"" search all buffers
nmap <Leader>sa :Lines<CR>
"" search current buffer
nmap <Leader>sb :BLines<CR>
"nmap <Leader>gc :Commits<CR>
"nmap <Leader>gf :GFiles?<CR>
nmap <Leader>ct :Tags<CR>
nmap <Leader>bt :BTags<CR>
nmap <Leader>hh :Helptags<CR>


"" ALT MAPPINGS
imap <A-bs> <C-w>
imap <A-left> <C-o>b
imap <A-right> <Esc>ea
cmap <A-bs> <C-w>
nmap <A-v> :edit $MYVIMRC<CR>
"" search stuff
nmap <A-/> :noh<CR>
imap <A-/> <Esc>:noh<CR>a
"" window stuff
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
"" Alt+Up :: jump to prev terminal command (☭  starts shell prompt)
tnoremap <A-up> <C-\><C-n>0?^☭ .*$<CR>
tnoremap <A-down> <C-\><C-n>$/^☭ .*$<CR>
nnoremap <A-up> <C-\><C-n>0?^☭ .*$<CR>
nnoremap <A-down> <C-\><C-n>$/^☭ .*$<CR>

"" ALT FZF:
nmap <A-e> :Explore<CR>
nmap <A-x> :Commands<CR>
"" search all open buffers
nmap <A-s> :Lines<CR>
"" search current buffer
nmap <A-S-s> :BLines<CR>
nmap <A-c> :Tags<CR>
nmap <A-S-c> :BTags<CR>
nmap <A-1> :Helptags<CR>
nmap <A-b> :Buffers<CR>

"" MISC. MAPPINGS
"" adjust window size with arrow keys:
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
"use C-j to jump (instead of C-o, used for FZF):
nnoremap <C-j> <C-o>
"" Emacs stuff:
nmap <C-x><C-s> :w<CR>
map <C-g> <Esc>
nmap <C-g> <Esc>
imap <C-g> <Esc>
vmap <C-g> <Esc>
cmap <C-g> <Esc>
" turn off linewise keys (j is 'down' with lines that wrap)
nmap j gj
nmap k gk


"" **** VIM-WIKI ****
nmap <Leader>ww <Plug>VimwikiIndex
"" these all come with vim-wiki by default
"nmap <Leader>ws <Plug>VimwikiUISelect
"nmap <Leader>wt <Plug>VimwikiTabIndex
"nmap <Leader>wi <Plug>VimwikiDiaryIndex
nmap <Leader>wb <Plug>VimwikiGoBackLink
nmap == <Plug>VimwikiAddHeaderLevel
nmap -- <Plug>VimwikiRemoveHeaderLevel
"nmap <A-Right> <Plug>VimwikiAddHeaderLevel
"nmap <A-Left> <Plug>VimwikiRemoveHeaderLevel
map <C-c><C-c> <Plug>VimwikiToggleListItem
map <C-c><C-c> <Plug>VimwikiToggleListItem
hi VimwikiHeader1 guifg=#009900
hi VimwikiHeader2 guifg=#FF0000
hi VimwikiHeader3 guifg=#00afff
hi VimwikiHeader4 guifg=#990000
hi VimwikiHeader5 guifg=#00a6b2
hi VimwikiHeader6 guifg=#005fd7


"" **** TERMINAL ****
tnoremap <Esc> <C-\><C-n><bs><bs><bs><bs> " escape returns to normal mode
nmap <A-t> :cd %:p:h<CR>:terminal<CR>Afish<CR>
nmap <A-S-t> :cd %:p:h<CR><C-w>s<CR>:terminal<CR>Afish<CR>


"" **** (vi)MAGIT ****
"" MAPPINGS: https://github.com/jreybert/vimagit#mappings
nmap <C-c>g :Magit<CR>
let g:magit_default_fold_level = 1
"" TODO: apply custom mapping to ONLY vimagit context?
"nmap <Tab> :call <SNR>68_mg_open_close_folding_wrapper('+')<CR>


"" **** PRETTIER ****
"" Running before saving (sync, do async with PrettierAsync)
let g:prettier#autoformat = 0
"" prettier config:
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
"" print spaces between brackets
let g:prettier#config#bracket_spacing = 'false'
"" jsx: put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'false'
"" avoid|always
let g:prettier#config#arrow_parens = 'always'
"" none|es5|all
let g:prettier#config#trailing_comma = 'all'
"" flow|babylon|typescript|css|less|scss|json|graphql|markdown
let g:prettier#config#parser = 'babylon'
"" css|strict|ignore
let g:prettier#config#html_whitespace_sensitivity = 'css'
"" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'
"" https://prettier.io/docs/en/cli.html#config-precedence
"" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'


"" **** FZF ****
let $FZF_DEFAULT_COMMAND = 'ag --nocolor -H -g "" 2>/dev/null'
let g:fzf_buffers_jump = 1
"FZF_PREVIEW_FILE_CMD "head -n 10"
let g:fzf_layout = { 'down': '~45%' }
"let g:fzf_layout = { 'window': 'enew' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"" [Tags] Command to generate tags file
""        - Example: generate tags for a Rails project:
""        - ctags -R --exclude=.git --exclude=log . (bundle list --paths) -f .tags-json
let g:fzf_tags_command = 'ctags -R'

"" Add preview to :Files cmd
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"" Add preview to :Ag! cmd
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('right:50%')
  \                         : fzf#vim#with_preview('right:10%:hidden', '?'),
  \                 <bang>0)



"" **** WHICH-KEY ****
noremap <silent> <leader> :WhichKey '<Space>'<CR>
noremap <silent> <localleader> :WhichKey ';'<CR>


let remote_repo = getremoterepo#GetRemoteRepo()

augroup orAirlineAfterInit
  "echomsg "after init, remote_repo:"
  "echomsg remote_repo
  autocmd User AirlineAfterInit let g:airline_section_a = "%{remote_repo}"
augroup END

augroup on_AirlineToggledOn
  "echomsg "toggled on, remote_repo:"
  "echomsg remote_repo

  autocmd User AirlineToggledOn let g:airline_section_a = "%{remote_repo}"
  "autocmd User AirlineToggledOn AirlineRefresh
augroup END

augroup on_BufWritePre
  "" prettier
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.rb,*.css,*.json,*.graphql,*.md,*.yaml,*.html Prettier
  "" Remove trailling whitespace on :w
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

augroup on_BufNewFile
  "" Create the file as soon as it's editing (no more phantom files)
  autocmd BufNewFile * :write
augroup END

augroup on_BufEnter
  "" cd to current file's context on entering buffer
  autocmd BufEnter * silent! lcd %:p:h

  "echomsg "buf enter, pwd:"
  "echomsg system(getcwd())
  "echomsg "buf enter, remote_repo:"
  "echomsg remote_repo
  autocmd * let g:airline_section_a = "%{remote_repo}"

augroup END

augroup filetype_fish
    autocmd!
    "" **** VIM-FISH ****
    "" Set up :make to use fish for syntax checking.
    autocmd FileType fish compiler fish
    "" Set this to have long lines wrap inside comments.
    autocmd FileType fish setlocal textwidth=79
    "" Enable folding of block structures in fish.
    autocmd FileType fish setlocal foldmethod=expr
    autocmd FileType fish nnoremap <buffer> <localleader>; I#<Esc>
augroup END

augroup filetype_javascript
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>; I//<Esc>
augroup END

augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>; I#<Esc>
augroup END

augroup filetype_ruby
    autocmd!
    autocmd FileType ruby nnoremap <buffer> <localleader>; I#<Esc>
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>; I"<Esc>
augroup END


