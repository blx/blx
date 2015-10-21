" This must be first, because it affects other options
set nocompatible

execute pathogen#infect()

syntax on

set synmaxcol=900 " don't try to highlight long lines

set nowrap
set expandtab
set tabstop=4
set autoindent
set number        " show line numbers
set shiftwidth=4  " number of spaces for indenting
set smarttab
set smartcase     " ignore case if search pattern is lowercase
set hlsearch      " highlight search results

set cursorline    " underline the current line

set backspace=indent,eol,start


set history=1000
set undolevels=1000
set wildignore=*.pyc
set title        " set the terminal's title

set clipboard=unnamed

filetype plugin indent on

set nofoldenable

set mouse=a       " use mouse scrolling!

nnoremap ; :

" hit Return to clear search highlighting
nnoremap <CR> :noh<CR>

" use CSS syntax on LESS files
autocmd BufNewFile,BufRead *.less set filetype=css

autocmd BufNewFile,BufRead *.cljs.hl set filetype=clojure
autocmd BufNewFile,BufRead *.cljs set filetype=clojure

autocmd BufNewFile,BufRead *.es6 set filetype=javascript

" Optimize for typing :keywords in clojure
autocmd BufNewFile,BufRead *.clj inoremap ; :
autocmd BufNewFile,BufRead *.clj inoremap : ;

" use w!! to sudo-write after opening
cmap w!! w !sudo tee % >/dev/null

