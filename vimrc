set nocompatible              " be iMproved, required

" ==== vim-plug ================================================================
call plug#begin('~/.vim/plugged')

" Airline and airline themes
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'racer-rust/vim-racer'
Plug 'zchee/deoplete-jedi'
" NERDTree
Plug 'scrooloose/nerdtree'
" Asynchronous Lint Engine
Plug 'w0rp/ale'
" The ultimate undo history visualizer for VIM
Plug 'mbbill/undotree', { 'on': ['UndotreeFocus', 'UndotreeShow', 'UndotreeToggle'] }
" Show git status in gutter.
Plug 'airblade/vim-gitgutter'
" Enhanced splash screen with RUFs.
Plug 'mhinz/vim-startify'

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
" Pest PEG grammar syntax support
Plug 'pest-parser/pest.vim'

" --- Python
" Vim uses current virtualenv.
Plug 'jmcantrell/vim-virtualenv'
" Black formatting
Plug 'ambv/black'

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
" Reveal the current file in the OS X Finder.
Plug 'henrik/vim-reveal-in-finder'
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


call plug#end()            " required

" NeoVim Python hosts
" let g:python_host_prog=$BREW_HOME.'/bin/python2'
let g:python3_host_prog='python3'

" ==============================================================================
" ==== Setup ===================================================================
set shell=zsh\ -l               " just so we're clear, vim
"set background=dark             " against a dark background
syntax on		                " syntax highlighting
set mouse=a		                " enable mouse
set termguicolors               " true colour scheme in the terminal
colorscheme flatland-monokai
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
                                " :W sudo saves the file
command W w !sudo tee % > /dev/null

" remap split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" current directory is always window-local
autocmd BufEnter * lcd %:p:h

" ==== Search ==================================================================
set incsearch                   " show matches while you type
set hlsearch                    " highlight matches
set ignorecase                  " search case insensitive
set smartcase                   " search case-sensitive when uppercase characters appear in search
                                " magic by default
nnoremap / /\v
                                " magic by default
cnoremap %s/ %s/\v


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
set columns=80                  " wrap text at 80 columns
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
    set guifont=PragmataProMono:h11 " set font
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


" ==== Airline =================================================================
let g:airline_powerline_fonts=1
let g:airline_theme = 'bubblegum'


" ==== Startify ================================================================
let g:ascii = [
\ "          .;CCC CCCC`<CCC>' ,<CCCCCC>>''.;C>>'''`<CCCCCC><CCC;<C>',<CCC",
\ "        . <CCCC, <CC>;,.,;<CCCC>>''.;<>,,,. -CCCC;.``''.;<C>>''',<CCC>",
\ "       <C;,CCCCC>.`C>'''''''  --<>;.``''<<<C;.`<<<CCCCCC>,;;<CCCCCCCC>;,",
\ "     ,CCCCCCCCC>' . `<C>' .,,zc,`<CCCC, -;.``<<>;<CCCCCCCCCC>>''''''<>'",
\ "    .<CCCCC''' zc$$$ccccc$$$$$$$h,.`<<C> <CCC;,,.``<`'CC>' .;<CCCCCC-",
\ "     ,CCCC' ,c$$$$$$$$$$$$$$$$$$$$$$cc,.  `'<<CCCCCCCCC,,<C`<CCC>>'    .,.",
\ "    ;CCCC' J$$$$$$$$$$$$$$$$$$$$$$$$$$$$$. `<>;,.```<<<<<CCC CC,.,,,;CC>'",
\ " .;C><C> z$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$. .`'<<<>>;,, <CC CCCCCCCCCC,,.",
\ "<C' `>   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$c CC>>;;, <C> CC,`CC>>'`'CCCCC",
\ "' ;C>;> J$$$$$$$$$$$$$$$$$$$$$$$$$????????$$$.`C''''<><>', CC,.,;;C>'`<CCC",
\ "  <CCC  $$$$$$$$$$$$$$$$$$$$$P\"  .,ccccccc$$$$. ,CCC>;,;<C,.``'''  ,<> .,'",
\ " ,CCC .<$$$$$$$$$$$$$$$$$$$$\"  zJ$$$$$$$$$$$$$$c <CCCC`<CCCCCCCCC>,`CC'<'",
\ ",CCC ; J$$$$$$$$$$$$$$$$$$$$,c$$??C????\"\"???$$$$hc`'>' ;.``<CC>>><C C> C>",
\ "CC>>;C ?$$$$$???????$$$$$$$$$$$FJP\",c===\"   J$$$$$c ;, <CC> <C><\<> C>;CC;",
\ ">  >' . $$P\".,,zzcc, \"$$$$$$$$$;\" ,.    $\" J$$$$$$$ <C> CCC <C < > <C `CCC",
\ ";<CCCC .`$,J$$$PCCC>?<C$$$$$$$$L -??    ,c$$$$$$$$$c C',CC> <' C,,;>   `CC",
\ "CCCC>',C ?$$CCJ?\"\"'_`,`\"$$$$$$$$$c,=cccd$$$$$$$$$$$$ C <C>  ,; C <>     `C",
\ "CCCC;,> .`$$$\",==\"\"-.  c<$$$$$$$$$$JJJJC?$$$$$$$$$$$ < CC < CC C,`>      `",
\ "CCCCCC;<C,`$F' .    `,JC:<$$$$$$$$$$$$$$$$$$$$$$$$$$>` <>-C CC,`C,`,.",
\ "`<C>`'CCCC,`h.,..,,,c$3C>:3$$$$$$$$$$$$$$$$$$$$$$$$$$ < <,<><`C;.`, <> .",
\ "    <C`<CC> $$$$$$$$$$$CC;<$$$$$$$$$$$$$$$$$$$$$$$$$$r`<;CCCCCCC>.' <> C;,",
\ "  ;CCC. CC>-`$$$$$$$$$$$CC:$$$$$$$$$?$$$$$$$$$$$$$$$$$.`<'`<CCCC>',C' <CCC",
\ "  <CC',<>',;.?$$$$$$$$$$C>;$$$$$9???-<$$$$$$$$$$$$$$$$$c,`-.``---''.,CCC>>",
\ ",C'CCCC ;.`C> $$$$$$$$$$$>`$$$$$F<;,c$$$$$$$$$$$$$$$$$$$$L `C>>;;<CCCCCCCC",
\ "C> CC>C,`C,`> `?$$$$$$$$$h;` `\"'.<$$$$$$$$$$$$$$$$$$$$$$$P . CCCCC,.;;.`''",
\ "'  `C `C;CC,CC; \"$$$$$$$$$$$$$$$$<$$$$$$$$$$$$$$$$$$$$$$P' C,`CCCCCCCCCCCC",
\ "    `C,.``<CCCCC, ?$$$$$$$$$$$????\"\"'\"\"\"\" J$$$$$$$$$$$$\" ..`C,C>`<<<<>>''<",
\ "     `CCCC;.``<CC>.`$$$$$$$???     .,c=:c$$$$$$$$$$$$P',$'< CC'C;  <CCCC>;",
\ "       <CCCCC>, `CC, \"$$$$$hcc,\"?C????JJ$$$$$$$$$$$$\",J$$ C CC <C . ``'',.",
\ "          `C>`CC,`<CC, \"$$$$$$$$$$>;;??$$$$$$$$$$$P',$$$$ C CC> C,`C;. <CC",
\ "         .,CC,`<C,,CCC .`?$$$$$$$$JJ$$$$$$$$$$$$P\",J$$$$F.>,CC><CC CCC> <C",
\ "       ;C>'CCC>.`<'<CC $c, ?$$$$$$$$$$$$$$$$$$$\" c$$$$$$ <><C> <CC ``<C;.`",
\ "      ,CC> `CCCCCCCCC',$$$h.`?$$$$$$$$$$$$$$$\" z$$$$$$$F;CC>',<CC>,C>.`<C;",
\ "      <C> <>.`'''<>'  $$$$$$$c \"$$$$$$$$$??\".z$$$$$$$$$ `\".;<CCC> .`<C; CC",
\ "      CC <CCC <C'<Cr J$$$$$$$$$c,``''\"\"'.zc$$$$$$$$$$$F;;CCCCC>' ;C, <CCCC",
\ "     <CC C><C CC CCC $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ CCCC>' .c;`<C> C <C",
\]
let g:startify_custom_header = g:ascii
let g:startify_list_order = ['files', 'bookmarks', 'sessions']
let g:startify_files_number = 5


" ==== Statusline / ALE ========================================================
if has('statusline')
    set laststatus=2                " last window always has a status line
endif

set statusline+=%#warningmsg#
set statusline+=%*
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\   'typescript': ['tsserver'],
\}
let g:ale_linters_ignore = {'typescript': ['tslint', 'eslint']}

" ==== NERDTree ================================================================
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" ==== deoplete =
" tab-completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

set hidden
let g:racer_cmd = "$HOME/.cargo/bin/racer"

" ==== vim-cpp-enhanced-highlight ==============================================
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" ==== Goyo ====================================================================
" We modify goyo to turn off our line-highlighting on entry.
function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set nocursorline
    set scrolloff=999
    Limelight
endfunction

function! s:goyo_leave()
    set cursorline
    set showcmd
    set showmode
    set scrolloff=5
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ==== vim-json ================================================================
let g:vim_json_syntax_conceal = 0
