set nocompatible              " be iMproved, required

set noerrorbells
set number
set showcmd
set noshowmode
set noswapfile
set nowritebackup
set splitright
set splitbelow
set encoding=utf-8
set autowrite
set autoread
set laststatus=2
set hidden
set ruler
set fileformats=unix,dos
set incsearch
set lazyredraw

set autoindent
set complete-=i
set showmatch
set smarttab

set et
set tabstop=4
set shiftwidth=4
set expandtab

set nrformats-=octal
set shiftround

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'mileszs/ack.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
" Plugin 'davidhalter/jedi-vim'
call plug#end()

syntax on
colorscheme molokai
"let g:airline_theme='molokai'
"let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme base16-monokai

let g:rehash256 = 1
let g:pymode_rope = 0
