" ==== Setup ===================================================================
set shell=zsh\ -l               " just so we're clear, vim
"set background=dark             " against a dark background
syntax on		                " syntax highlighting
set mouse=a		                " enable mouse
set termguicolors               " true colour scheme in the terminal
colorscheme monokai
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
                                " :W sudo saves the file
command! W w !sudo tee % > /dev/null
                                " current directory is always window-local
autocmd BufEnter * lcd %:p:h

" ==== Search ==================================================================
set incsearch                   " show matches while you type
set hlsearch                    " highlight matches
set ignorecase                  " search case insensitive
set smartcase                   " search case-sensitive when uppercase characters appear in search


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
autocmd BufEnter *.tsx set filetype=typescript


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

" let macvim_skip_colorscheme=1
" let g:molokai_original=1
highlight SignColumn guibg=#272822

if has('cmdline_info')
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif


" ==== GUI stuff ===============================================================
if has('gui_running')
    set lines=80                    " minimum 80 lines
    set guifont=PragmataPro Mono:h11 " set font
    " colorscheme Broadcast         " broadcast
    colorscheme flatland-monokai    " monokai
    " set noantialias               " doubleplus jaggies
    set encoding=utf-8
    set guioptions-=T               " include toolbar
else
    if &term=='xterm' || &term == 'screen'
        set t_Co=256            " 256 colour
    endif
endif


" ==== keymap ==================================================================
let mapleader = " "
if has('nvim')
    if has('win32')
        nnoremap <leader>ev :e ~/_vimrc<cr>
    else
        nnoremap <leader>ev :e ~/.vimrc<cr>
    endif
endif
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

" ==== Statusline ==============================================================
if has('statusline')
    set laststatus=2                " last window always has a status line
endif

set statusline+=%#warningmsg#
set statusline+=%*
