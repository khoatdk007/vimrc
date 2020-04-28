set nu
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set ww+=<,>
set autoindent
syntax on
colorscheme monokai-bold
highlight Normal ctermbg=black
let g:monokai_term_italic=1
let g:monokai_gui_italic=1
filetype plugin indent on
call plug#begin('C:/Users/khoat/AppData/Local/nvim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  Plug 'vim-python/python-syntax'
	Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'mxw/vim-jsx'
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
inoremap () ()
inoremap (; ();<left><left>
inoremap { {}<left>
inoremap {} {}
inoremap {<CR> {<CR>}<ESC>O
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:class_scope_highlight = 1 
