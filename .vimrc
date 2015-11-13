" This must be first, because it affects other options
set nocompatible

execute pathogen#infect()

syntax on

set synmaxcol=900 " don't try to highlight long lines

set nowrap
set expandtab
set tabstop=4
set autoindent
set pastetoggle=<F2>
set timeoutlen=60
set number        " show line numbers
set shiftwidth=4  " number of spaces for indenting
set smarttab
set smartcase     " ignore case if search pattern is lowercase
set hlsearch      " highlight search results
hi Search cterm=NONE ctermfg=white ctermbg=blue

set cursorline    " underline the current line
set colorcolumn=85
set laststatus=2  " always show statusbar (+ enable vim-airline)

set backspace=indent,eol,start


set list    " show hidden chars (only tabs though)
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ 


set history=1000
set undolevels=1000
set title        " set the terminal's title

set wildignore=*.pyc
set wildignore+=*DS_Store*

set clipboard=unnamed

filetype plugin indent on

set nofoldenable

set mouse=a       " use mouse scrolling!

nnoremap ; :

" hit Return to clear search highlighting
nnoremap <CR> :noh<CR>

"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#default#layout = [
    \ [ 'c' ],
    \ [ 'z' ]
    \ ]

" use CSS syntax on LESS files
autocmd BufNewFile,BufRead *.less set filetype=css

autocmd BufNewFile,BufRead *.cljs.hl set filetype=clojure
autocmd BufNewFile,BufRead *.cljs set filetype=clojure

autocmd BufNewFile,BufRead *.es6 set filetype=javascript

" Optimize for typing colons in python and clojure
autocmd BufNewFile,BufRead *.clj inoremap ; :
autocmd BufNewFile,BufRead *.clj inoremap : ;
autocmd BufNewFile,BufRead *.py inoremap ; :
autocmd BufNewFile,BufRead *.py inoremap : ;

" use w!! to sudo-write after opening
cmap w!! w !sudo tee % >/dev/null

