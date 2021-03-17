
" Enable for startup time testing
" Plug 'tweekmonster/startuptime.vim'
"
" Airline and airline themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'racer-rust/vim-racer'

" NERDTree
Plug 'scrooloose/nerdtree'
" The ultimate undo history visualizer for VIM
Plug 'mbbill/undotree', { 'on': ['UndotreeFocus', 'UndotreeShow', 'UndotreeToggle'] }
" Show git status in gutter.
Plug 'airblade/vim-gitgutter'
" Enhanced splash screen with RUFs.
Plug 'mhinz/vim-startify'

" === Search
" Search with rg
Plug 'jremmen/vim-ripgrep'
" Search with fzf
Plug 'junegunn/fzf.vim'

" === Language plugins
Plug 'sheerun/vim-polyglot'
" --- C/C++
" Extra highlighting of typedefs, enumerations etc (based on ctags)
Plug 'vim-scripts/TagHighlight', { 'for': ['c', 'cpp'] }

" --- Python
" Vim uses current virtualenv.
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }

" --- txt
" distraction-free writing
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
" paragraph highlighting for the above
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'
" Decrease reliance on single-key navigation.
Plug 'takac/vim-hardtime'
" Highlight trailing whitespace.
Plug 'bronson/vim-trailing-whitespace'
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"
" Colour schemes
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'sickill/vim-monokai'
