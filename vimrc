""" vim config
""" Author: Chun Li


""" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
call plug#end()

" Plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

autocmd FileType racket setlocal commentstring=;\ %s

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


""" SET CONFIGS
" enable syntax highlighting
syntax enable
filetype plugin indent on
colorscheme molokai
highlight Comment ctermfg=blue " make comments readable
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set cc=100                                                   " color column
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory=/tmp/                                          " store swapfiles in tmp
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set hlsearch                                                 " set highlight search
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set mouse=a                                                  " Enable basic mouse behavior such as resizing buffers.
set nocompatible                                             " don't bother with vi compatibility
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=4                                             " normal mode indentation commands use 4 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=4                                            " insert mode tab and backspace use 4 spaces
set tabstop=4                                                " actual tabs occupy 4 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full


""" MAPPINGS
" keyboard shortcuts
let mapleader = ','
" buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" plugins
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>G :Gblame<CR>
noremap <leader><tab> :set list!<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" tab creation
:map <C-t> :tabe<CR>
:imap <C-t> <ESC>:tabe<CR>
:vmap <C-t> <ESC>:tabe<CR>
" tabbing
:nmap <tab> >>
:nmap <S-tab> <<
:vmap <tab> >
:vmap <S-tab> <
" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %


""" FILETYPES
" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType racket setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType lisp setlocal expandtab shiftwidth=2 softtabstop=2


""" FIXES
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
if exists('$TMUX') && !has('nvim') " Support resizing in tmux
  set ttymouse=xterm2
endif
" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" Don't copy the contents of an overwritten selection.
vnoremap p "_dP
