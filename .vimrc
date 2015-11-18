" This must be first, because it affects other options
set nocompatible

execute pathogen#infect()

syntax on

set synmaxcol=900 " don't try to highlight long lines

set hidden
set autoread
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
hi Search cterm=NONE ctermfg=white ctermbg=LightBlue
hi Visual ctermbg=LightGreen

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
set splitright
set splitbelow

set wildmenu
set wildmode=list:longest
set wildignore=*.pyc
set wildignore+=*DS_Store*

set clipboard=unnamed

filetype plugin indent on

set nofoldenable

set mouse=a       " use mouse scrolling!


""" NORMAL mode  =======================

nnoremap ; :

" <return> = clear search highlighting
nnoremap <CR> :noh<CR>

" shift-up = shift this line, starting at cursor, up to end of prev line, then
"            bring cursor to start of next line
"            AKA eat everything from here up to last non-whitespace of prev
"            line
nnoremap <silent> <Plug>DeleteUntilEndAbove hvk$belc<space><esc>+
            \:call repeat#set("\<Plug>DeleteUntilEndAbove")<CR>
nmap <s-up> <Plug>DeleteUntilEndAbove


""" VISUAL mode  =======================

" Go to next line after leaving visual mode
"xnoremap <esc> <esc>j

" Reselect selection after each indent
"xnoremap > >gv
"xnoremap < <gv


""" COMMAND mode  ======================

" use w!! to sudo-write after opening
cmap w!! w !sudo tee % >/dev/null


"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#default#layout = [
    \ [ 'c' ],
    \ [ 'z' ]
    \ ]

autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.cljs,*.cljs.hl set filetype=clojure

" Optimize for typing colons in relevant languages
autocmd FileType clojure,python,json inoremap <buffer> ; :
autocmd FileType clojure,python,json inoremap <buffer> : ;


" large file is >= 5 MB
let g:LargeFile = 1024 * 1024 * 5
augroup LargeFile
    autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
    " syntax highlighting off
    setlocal eventignore+=FileType

    setlocal bufhidden=unload
    setlocal buftype=nowrite
    setlocal undolevels=5

    autocmd VimEnter *  echo "File larger than " . (g:LargeFile / 1024 / 1024) . " MB; some options have been disabled."
endfunction
