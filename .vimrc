"set plugins
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

"fold code
Plugin 'tmhedberg/SimpylFold'
"auto-complete
Plugin 'vim-scripts/indentpython.vim'
"check syntax
Plugin 'scrooloose/syntastic'
"check PEP8
Plugin 'nvie/vim-flake8'
"color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"file browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"super search, press Ctrl-p to enable the search
Plugin 'kien/ctrlp.vim'
"git integration
Plugin 'tpope/vim-fugitive'
"airline
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" personal preferences
let python_highlight_all=1
syntax on
set nu
color pablo

"set python PATH
let $PYTHONPATH='/usr/lib/python3.6/site-packages'
set laststatus=2
"let g:powerline_pycmd = 'py3'
"let g:Powerline_symbols= "fancy"
"set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
"let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

  " unicode symbols
let g:airline_symbols.crypt = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" set which color scheme to choose, and toggle Solarized's dark and light theme by pressing F5
"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif
"call togglebg#map("<F5>")

"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 
" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

"map comment function
vnoremap <Leader>c :s/^/# /<CR>
vnoremap <Leader>u :s/^# /<CR>


" set youcompleteme The former line ensures that the autocomplete window goes away when you’re done with it, and the latter defines a shortcut for goto definition.
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" To add the proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


" To add the proper indentation for full stack development
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"UTF8 Support
set encoding=utf-8
