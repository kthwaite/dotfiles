
" Enable for startup time testing
" Plug 'tweekmonster/startuptime.vim'
"
" Airline and airline themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'racer-rust/vim-racer'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" NERDTree
Plug 'scrooloose/nerdtree'
" The ultimate undo history visualizer for VIM
Plug 'mbbill/undotree', { 'on': ['UndotreeFocus', 'UndotreeShow', 'UndotreeToggle'] }
" Show git status in gutter.
Plug 'airblade/vim-gitgutter'
" Enhanced splash screen with RUFs.
Plug 'mhinz/vim-startify'

" --- Search
" Search with rg
Plug 'jremmen/vim-ripgrep'
" Search with fzf
Plug 'junegunn/fzf.vim'

" --- C/C++
" Enhanced C++ highlighting.
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
" Extra highlighting of typedefs, enumerations etc (based on ctags)
Plug 'vim-scripts/TagHighlight', { 'for': ['c', 'cpp'] }

" --- Rust
" rust.vim
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" TOML syntax
Plug 'cespare/vim-toml', { 'for': 'toml' }

" --- Python
" Vim uses current virtualenv.
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
" Black formatting
Plug 'ambv/black', {'for': 'python'}

" --- Javascript
" Syntax highlighting for JSON in Vim
Plug 'elzr/vim-json', { 'for': 'json' }
" ES6 support
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
" Javascript
Plug 'pangloss/vim-javascript'
" JSX
Plug 'mxw/vim-jsx'
" Typescript
Plug 'leafgarland/typescript-vim'

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
" Override awful default YAML syntax highlighting
Plug 'stephpy/vim-yaml'
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"
" Colour schemes
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
