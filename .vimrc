" configure vundle
set shell=/bin/bash " avoid problem in fish

set nocompatible " be iMproved /N
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'CSApprox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'SuperTab--Van-Dewoestine'
Plugin 'The-NERD-Commenter'
Plugin 'scrooloose/syntastic'

" for python
Plugin 'davidhalter/jedi-vim'
Plugin 'andviro/flake8-vim'

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

let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

"set ruler " show line and row number on cursor
set showmatch " show matching bracket
set hidden "switching buffers without saving
set showcmd " display incomplete commands
set clipboard=unnamed " use system clipboard
set backspace=indent,eol,start " backspacing in insert mode /N
set cursorline " highlight current line
set scrolloff=6
"set relativenumber
set visualbell
set autoread " reload files when changed on disk /N
set wildmenu " GREAT autocomplete menu /N
"set foldmethod=indent

" for search
set ignorecase " case-insensitive search
set smartcase " case-sensitive search if any caps
set incsearch " search as you type /N
set hlsearch " /N
set magic

" mimic emacs
inoremap <c-b> <Left>
inoremap <c-f> <Right>
inoremap <c-a> <Home>
inoremap <c-e> <End>
inoremap <c-d> <Del>
inoremap <c-h> <BS>
" cmdline-editing
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-d> <Del>

" indent
set autoindent " /N
set cindent

" no template files
set nobackup
set nowritebackup
set noswapfile

" persistent undo
set undofile
set undodir=~/.undo
set history=10000 " /N

" encoding
if has("multi_byte")
  "set encoding=utf-8 " /N
  set termencoding=utf-8 " /N
  set fileencodings=utf-8,chinese,latin-1
endif

" menu encoding
if has("gui_running")
  source $VIMRUNTIME/delmenu.vim
  set langmenu=zh_CN.UTF-8
  source $VIMRUNTIME/menu.vim
  language messages zh_CN.utf-8
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a "/N
endif

set background=dark
colorscheme jellybeans
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" for osx
if has("gui_running")
  set go=aAce
  set transparency=10
  set guifont=Source\ Code\ Pro\ For\ Powerline:h19
endif

" indent
"setlocal expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4 
autocmd FileType python setlocal et sta ts=4 sts=4 sw=4
autocmd FileType html,vim,javascript,haskell,c,cpp setlocal et sta ts=2 sts=2 sw=2

autocmd FileType python setlocal makeprg=python\ %
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
set laststatus=2 " /N
set noshowmode
set linespace&
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = [ 'indent' ]
let g:airline_theme = 'bubblegum'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" jedi-vim
" goto:<leader>g  defn:<leader>d  doc:K  rename:<leader>r  related:<leader>n
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" flake8-vim
autocmd FileType python map <buffer> <F7> :PyFlake<CR>
let g:PyFlakeOnWrite = 0
let g:PyFlakeDisabledMessages = 'E226'
" let g:PyFlakeRangeCommand = 'Q'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap ,u :GundoToggle<CR>
