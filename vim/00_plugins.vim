" Airline and airline themes
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-buffer'   " nvim-cmp source for buffer words.
Plug 'hrsh7th/nvim-cmp'     " Autocompletion plugin
Plug 'hrsh7th/cmp-path'     " Path plugin for nvim-cmp
Plug 'hrsh7th/cmp-cmdline'  " Command-line plugin for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'    " Snippets for nvim-cmp
Plug 'hrsh7th/vim-vsnip'

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

" --- txt
" distraction-free writing
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
" paragraph highlighting for the above
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'
" Decrease reliance on single-key navigation.
Plug 'takac/vim-hardtime'
" Highlight trailing whitespace.
Plug 'bronson/vim-trailing-whitespace'
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Colour schemes
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'sickill/vim-monokai'
