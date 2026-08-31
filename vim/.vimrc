" ~/.vimrc - minimal, portable config for editing k8s manifests (CKA exam)
" no plugins, no gui/mac/windows conditionals - just built-in vim options
" that also degrade harmlessly if ever sourced by plain vi.

syntax on
filetype plugin indent on

set nocompatible
set number
set ruler
set showcmd
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile