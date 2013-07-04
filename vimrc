call pathogen#infect()

set number
set title
set hidden

" stop vim from writing backup files
set nobackup
set noswapfile

" highlight current line
set cursorline

" tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" history and undo
set history=1000
set undolevels=1000

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" make backspace behave properly
set backspace=indent,eol,start

" Use % to match brackets, do/end, etc
runtime macros/matchit.vim

set wildmenu

set scrolloff=3

" Prevent vim from spreading temp files all over the place
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" syntax stuff
syntax on
filetype on
filetype plugin on
filetype indent on

" colors!
set background=dark
colorscheme solarized

"
" KEYMAPS
"
let mapleader=","

"
" edit vimrc
"
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" Pastetoggle key
set pastetoggle=<F2>

"
" Set command key to ;
"
nnoremap ; :
nnoremap <CR> :noh<CR>

"
" Easy window navigation
"
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"
" Map change directory key
"
nnoremap <leader>fd :cd %:p:h<CR>

"
" Multipurpose tab key
"
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

"
" Command-T settings
"
" set wildignore+=.git,.svn
" nmap <silent> <leader>fb :CommandTBuffer<cr>
" nmap <silent> <leader>ff :CommandT<cr>
" nmap <silent> <leader>fu :CommandTFlush<cr>

" CTRLP settings
nmap <silent> <leader>ff :CtrlP<cr>
nmap <silent> <leader>fb :CtrlPBuffer<cr>
nmap <silent> <leader>ft :CtrlPTag<cr>

" Ctags
nmap <silent> <F6> :!ctags -R<cr>


"
" STATUS BAR
"
set laststatus=2
"set statusline=%M%-20t\ (%-2l,%3c)
set statusline=
set statusline+=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
