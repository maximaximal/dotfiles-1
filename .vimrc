" configure vundle
set shell=/bin/bash " avoid problem in fish

set nocompatible " be iMproved
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'CSApprox'
Plugin 'davidhalter/jedi-vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'SuperTab--Van-Dewoestine'
Plugin 'The-NERD-Commenter'
Plugin 'andviro/flake8-vim'
Plugin 'scrooloose/syntastic'

" for haskell
Plugin 'dag/vim2hs'
"Plugin 'travitch/hasksyn'
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc.vim'
"Plugin 'nbouscal/vim-stylish-haskell'

" unused
"Plugin 'Align'
" EasyMotion trigger:<leader><leader>[fFwb]
"Plugin 'EasyMotion'
" :NERDTree " q to quit
"Plugin 'scrooloose/nerdtree'
"Plugin 'sjl/gundo.vim'

call vundle#end()
filetype plugin indent on
syntax on
""""""""""""""""""""""""""""""""""""""""""""""

"set ruler " show line and row number on cursor
set showmatch " show matching bracket
set hidden "switching buffers without saving
set showcmd " display incomplete commands
set clipboard=unnamed " use system clipboard
set backspace=indent,eol,start " backspacing in insert mode
set cursorline
set scrolloff=6
"set relativenumber
set visualbell
"set list " show trailing whitespace
set autoread " reload files when changed on disk

" for search
set ignorecase " case-insensitive search
set smartcase " case-sensitive search if any caps
set incsearch " search as you type
set hlsearch
set magic

" indent
set autoindent
set smartindent
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

" no template files
set nobackup
set nowritebackup
set noswapfile

" persistent undo
set undofile
if has("win32")
  set undodir=d:/vimundo
else
  set undodir=~/.vimundo
endif
set history=500

" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese,latin-1

" menu encoding
if has("gui_running")
  source $VIMRUNTIME/delmenu.vim
  set langmenu=zh_CN.UTF-8
  source $VIMRUNTIME/menu.vim
endif
language messages zh_CN.utf-8

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set background=dark
colorscheme jellybeans

if has("gui_running")
  if has("win32")
    set go=aAcegmrL
    set guifont=Source_Code_Pro_for_Powerline:h14:cANSI
    set guifontwide=Microsoft_YaHei:h14
  elseif has('mac')
    set go=aAce
    set transparency=10
    set guifont=Source\ Code\ Pro\ For\ Powerline:h19
  else
      "Linux options here
  endif
endif

" indent
"setlocal expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4 
autocmd FileType python,haskell,c,cpp setlocal et sta ts=4 sts=4 sw=4
autocmd FileType html,vim setlocal et sta ts=2 sts=2 sw=2

autocmd FileType python setlocal makeprg=python\ %
autocmd FileType haskell setlocal makeprg=runhaskell\ %
autocmd FileType c setlocal makeprg=gcc\ -Wall\ -g\ %\ -o\ %<
autocmd FileType cpp setlocal makeprg=g++\ -Wall\ -g\ %\ -o\ %<

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
map<silent><leader>ss :source ~/.vimrc<cr>
map<silent><leader>ee :e ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
nnoremap gb :bn<cr>
nnoremap gB :bp<cr>

" mimic emacs
imap <c-b> <Left>
imap <c-f> <Right>
imap <c-a> <Home>
imap <c-e> <End>
imap <c-d> <Del>
imap <c-h> <BS>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" airline
set laststatus=2
set noshowmode
set linespace&
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = [ 'indent' ]
let g:airline_theme = 'powerlineish'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" jedi-vim
" goto:<leader>g  defn:<leader>d  doc:K  rename:<leader>r  related:<leader>n
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" flake8-vim
autocmd FileType python map <buffer> <F7> :PyFlake<CR>
let g:PyFlakeOnWrite = 0
let g:PyFlakeDisabledMessages = 'E226'
"let g:PyFlakeAggressive = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim2hs
let g:haskell_conceal = 0
"let g:haskell_conceal_wide = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" neco-ghc
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1
