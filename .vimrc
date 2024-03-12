set showmode
set nocompatible
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set mouse=a

silent! call plug#begin('~/.vim/bundle')
call plug#begin()
Plug 'rodjek/vim-puppet'
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
call plug#end()

set laststatus=2
au FileType puppet setl sw=4 sts=4 et

colorscheme jellybeans
