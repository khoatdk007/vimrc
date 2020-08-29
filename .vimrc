set nu
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set ww+=<,>
set autoindent
syntax on
colorscheme default
highlight Normal ctermbg=black
highlight LineNr ctermfg=lightred
highlight String ctermfg=yellow
highlight Comment ctermfg=gray
let g:monokai_term_italic=1
let g:monokai_gui_italic=1
filetype plugin indent on
call plug#begin('~/vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'vim-python/python-syntax'
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'mxw/vim-jsx'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'alvan/vim-closetag'
  Plug 'pangloss/vim-javascript'
call plug#end()
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"mapping
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap [ []<left>
inoremap [] []
inoremap [; [];<left><left>
inoremap ( ()<left>
inoremap (; ();<left><left>
inoremap () ()
inoremap { {}<left>
inoremap {} {}
inoremap {<CR> {<CR>}<ESC>O
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
