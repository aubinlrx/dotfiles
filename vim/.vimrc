set nocompatible    " Make Vim more usefull

" === Plug ===

if filereadable(expand(~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" === Genral config ===

filetype on

set history=1000
set visualbell
set autoread
set hidden
set ttyfast
set scrolloff=3
set mouse=a
set backspace=indent,eol,start
set clipboard=unnamed

" === UI Layout ===

syntax on
set termguicolors
set number
set colorcolumn=90
set cursorline=90
set ruler
set title
set showmatch
set showcmd
set wildmode=list:longest,full
set wildmenu

" === Indentation ===

filetype indent on

set autoindent
set smartindent
set smarttab
set shiftwidth=4	" 4 spaces tab
set softtabstop=4	" 4 spaces tabs
set expandtab		" Use space for tabs

" === Plugins ===

filetype plugin on

" Gitgutter - always on
set signcolumn=yes
