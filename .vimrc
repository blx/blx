" This must be first, because it affects other options
set nocompatible

execute pathogen#infect()

syntax on

set synmaxcol=900 " don't try to highlight long lines

let mapleader=" "

set hidden
set autoread
set nowrap
set expandtab
set tabstop=4
set autoindent
set pastetoggle=<F2>
set timeoutlen=200
set ttimeoutlen=100
set number        " show line numbers
set shiftwidth=4  " number of spaces for indenting
set smarttab
set smartcase     " ignore case if search pattern is lowercase
set hlsearch      " highlight search results
set incsearch
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

" fzf fuzzy finder
set rtp+=~/.fzf


""" NORMAL mode  =======================

nnoremap ; :

" Move up/down by visual line, not logical line (relevant when setwrap is on)
nmap j gj
nmap k gk

" Easier split-window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Highlight search results as we type
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)

" Find files quickly
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" Forward/back through buffers
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>d :bp<CR>

" <return> = clear search highlighting
nnoremap <CR> :noh<CR>

" ctrl-a = select all
nnoremap <c-a> ggVG

" shift-up = shift this line, starting at cursor, up to end of prev line, then
"            bring cursor to start of next line
"            AKA eat everything from here up to last non-whitespace of prev
"            line
nnoremap <silent> <Plug>DeleteUntilEndAbove hvkg_lc<space><esc>+
            \:call repeat#set("\<Plug>DeleteUntilEndAbove")<CR>
nmap <s-up> <Plug>DeleteUntilEndAbove


""" VISUAL mode  =======================

xnoremap ; :

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

" let g:CommandTFileScanner = "git"
" Include .gitignored files for now because since ~/.git has 'ignore *',
" we can't find anything under ~ unless it's either in the ~/.git repo OR
" in its own repo.
let g:CommandTFileScanner = "find"



if has("autocmd")
    autocmd BufNewFile,BufRead *.less set filetype=css
    autocmd BufNewFile,BufRead *.es6 set filetype=javascript
    autocmd BufNewFile,BufRead *.cljs,*.cljs.hl set filetype=clojure

    " Optimize for typing colons in relevant languages
    autocmd FileType clojure,python,json,vim inoremap <buffer> ; :
    autocmd FileType clojure,python,json,vim inoremap <buffer> : ;

    autocmd FileType markdown setlocal wrap


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
endif


if executable("python")
    function! FormatJSON()
        :'<,'>!python -m json.tool
    endfunction
    command! -range FormatJSON call FormatJSON()
endif
