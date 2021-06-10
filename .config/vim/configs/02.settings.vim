let mapleader = ","

set autoindent
set smartindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2

set hlsearch
set ignorecase
set incsearch
set smartcase

set encoding=utf-8
syntax enable
set linebreak

"==========
set termguicolors
set colorcolumn=80
colorscheme dracula
set nu
set relativenumber
set cursorline
hi clear cursorline

set noswapfile
set backspace=indent,eol,start

"==========Mapping==========
imap {<CR> {<CR>}<ESC>O
imap {{ {
map <Leader>w <C-w>w
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
map <C-h> :noh<CR>
map g= mzgg=G`z
autocmd filetype cpp nmap <Leader>z :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
autocmd filetype cpp nmap <F8> :w <bar> !clear;  g++ -static -Wall -Wextra -std=c++17 % -o %:r <CR>
autocmd filetype cpp nmap <F9> :!clear; if [ -f %:r ]; then time ./%:r; else echo "Not compiled yet"; fi <CR>
autocmd filetype c map <F8> :w <bar> :!clear; gcc -g -Wall % -o %:r;<CR>
autocmd filetype c nmap <F9> :!clear; if [ -f %:r ]; then time ./%:r; else echo "Not compiled yet"; fi<CR>
"avoid recursion :v
map x "_s<ESC>l
nmap x s<ESC>l
 
"change cursor for insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeoutlen=0
set belloff=all
set t_vb=
cd ~/CP
