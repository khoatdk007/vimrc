let mapleader = ","

set shell=powershell

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
colorscheme dracula
set relativenumber
set cursorline
hi clear cursorline
if has("gui_running")
  if has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

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
autocmd filetype cpp nmap <F8> :w <bar> !cls; g++ -std=c++17 -Wall % -o %:r \"-Wl,--stack=268435456\"<CR>
autocmd filetype cpp nmap <F9> :!cls; ./%:r;<CR>
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
