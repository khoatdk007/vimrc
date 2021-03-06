let mapleader = ","

if has("win32") || (has("gui_running") && has("gui_win32"))
  set shell=powershell
endif

set history=1000
set autoindent
set smartindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2

set nohlsearch
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
set number
set relativenumber
set cursorline
hi clear cursorline
if has("gui_running")
  if has("gui_win32")
    set guifont=Cascadia_Code:h11:cANSI
  endif
endif

set noswapfile
set backspace=indent,eol,start

"==========Mapping==========
imap {<CR> {<CR>}<ESC>O
map <Leader>w <C-w>w
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
map <C-h> :noh<CR>
map g= mzgg=G`zzz
if has("win32")
  autocmd filetype cpp nmap <F8> :w <bar> !cls; g++ -std=c++17 -Wall % -o %:r \"-Wl,--stack=268435456\"<CR>
  autocmd filetype cpp nmap <F9> :!cls; ./%:r;<CR>
else
  autocmd filetype cpp nmap <F8> :w <bar> !clear;  g++ -static -Wall -Wextra -std=c++17 % -o %:r <CR>
  autocmd filetype cpp nmap <F9> :!clear; if [ -f %:r ]; then time ./%:r; else echo "Not compiled yet"; fi <CR>
endif
if (has("gui_running") && has("gui_win32"))
  autocmd filetype cpp nmap <F8> :w <bar> !cls; g++ -std=c++17 -Wall % -o %:r \"-Wl,--stack=268435456\"<CR><CR>
  autocmd filetype cpp nmap <F9> :!cls; ./%:r;<CR><CR>
endif
autocmd filetype c map <F8> :w <bar> :!clear; gcc -g -Wall % -o %:r;<CR>
autocmd filetype c nmap <F9> :!clear; if [ -f %:r ]; then time ./%:r; else echo "Not compiled yet"; fi<CR>
"avoid recursion :v
"map x i<DEL><ESC>l
"nmap x s<ESC>l

"change cursor for insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set ttimeoutlen=0
set belloff=all
set t_vb=
