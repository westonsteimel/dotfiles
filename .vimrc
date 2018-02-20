set nocompatible              " be iMproved, required
set number

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
call plug#end()

syntax on
colorscheme molokai

let g:rehash256 = 1
let g:pymode_rope = 0
