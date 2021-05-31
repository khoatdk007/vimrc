call plug#begin('~/vim/plugged')
Plug 'dracula/vim', {'as' : 'dracula'}
Plug 'scrooloose/nerdtree'
Plug 'vim-python/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim', {'as': 'onedark'}
call plug#end()

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*js'
let g:closetag_shortcut = '>'
let g:closetag_regions = {
      \'tjavascript.jsx': 'jsxRegion',
      \}
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo', 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }
set laststatus=2
let NERDTreeShowHidden=1
noremap <C-s> :NERDTreeToggle<CR>
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set hlsearch
colorscheme dracula

set ww+=<,>

set autoindent
set smartindent

set nobackup
set nowritebackup
set noswapfile

set relativenumber
set number
set numberwidth=4
syntax on

set backspace=indent,eol,start
set clipboard=unnamedplus
set background=dark
set termguicolors

if has('gui_running')
  colorscheme dracula
  set guifont="Monospace Regular":h12
endif
filetype plugin indent on

set cursorline
hi clear cursorline
inoremap {<CR> {}<Left><CR><ESC>O
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <C-h> :noh<CR>
noremap g= mzgg=G`z
noremap x "_x
xnoremap x x
"mapping
autocmd filetype cpp nnoremap <F9> :w <bar> !clear; g++ -std=c++17 % -O2 -Wall -Wextra -DLOCAL -o %:r; if [ -f %:r ]; then time ./%:r; rm %:r; fi<CR>
autocmd filetype c map <F9> :w <bar> :!clear; gcc -g -Wall % -o %:r; if [ -f %:r ]; then time ./%:r; rm %:r; fi <CR>
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:class_scope_highlight = 1 
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
