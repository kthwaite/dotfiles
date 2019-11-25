set nocompatible              " be iMproved, required

" ==============================================================================
" ==== Setup ===================================================================
set shell=zsh\ -l               " just so we're clear, vim
"set background=dark             " against a dark background
color flatland-monokai
syntax on		                " syntax highlighting
set mouse=a		                " enable mouse
set termguicolors               " true colour scheme in the terminal
set mousehide 		            " hide mouse cursor while typing
set encoding=utf-8              " default encoding is utf-8
scriptencoding utf-8            " script encoding is utf-8
set fileformats=unix,dos,mac    " prefer Unix over Windows over OS 9 formats
set history=1000                " 1000 lines of history
set shortmess+=filmnrxoOtT      " [noeol], 00L/00C, [+], [New], [RO], [unix]
                                " write/read overwrite, truncate
set autoread                    " auto-reload modified files
set noswapfile                  " no swapfile
set nobackup                    " no backup files
set bs=indent,eol,start         " backspace over everything!
set ruler                       " display cursor position
set lazyredraw                  " faster macro invocation
set title                       " set window title
set titlestring=%t              " ibid

" ==== Formatting ==============================================================
set wrap                        " wrap lines
set autoindent		            " keep prev indent
set smartindent                 " smart autoindenting
set smarttab                    " insert shiftwidth blanks
set shiftwidth=4	            " width of shift, spaces
set softtabstop=4               " number of tab-spaces while editing
set expandtab 		            " tabs are spaces
set tabstop=4		            " tabs are worth 4 spaces
                                " force *.md files to be opened as markdown.
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.cls set filetype=vb
                                " use xmllint to reindent XML when using 'gg=G'
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" YAML is two-spaced by default
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" ==== UI ======================================================================
set cursorline 		            " highlight current line
set showmode 		            " show current mode
highlight clear LineNr          " highlight the current line number
highlight clear SignColumn      " highlight gutter symbols
set number                      " line numbers on
set relativenumber              " for fast vertical movement
set linespace=0                 " no extra spaces between rows
                                " mkview preserves EVERYTHING
set vop=cursor,folds,options,slash,unix
set virtualedit=onemore         " cursor after EOL
set showmatch                   " show search matches
set wildmenu                    " show list for autocomplete
set wildmode=list:longest,full  " list all matches and complete
set colorcolumn=88,161          " indicate col80, col161
set nofoldenable                " automatic code folding is the devil's work

" ==== keymap ==================================================================
let mapleader = " "
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>
inoremap <esc> <nop>
" remap split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
                                " magic by default
nnoremap / /\v
                                " magic by default
cnoremap %s/ %s/\v
