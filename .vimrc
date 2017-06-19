set nocompatible              " be iMproved, required
filetype off                  " required

" ==== Vundle ==================================================================
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Airline and airline themes
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" A code-completion engine for Vim
Plugin 'Valloric/YouCompleteMe'
"
Plugin 'nvie/vim-flake8'
" NERDTree
Plugin 'scrooloose/nerdtree'
" Syntastic
Plugin 'scrooloose/syntastic'
" Enhanced C++ highlighting.
Plugin 'octol/vim-cpp-enhanced-highlight'
" rust.vim
Plugin 'rust-lang/rust.vim'
" TOML syntax
Plugin 'cespare/vim-toml'
" Racer support for Vim
Plugin 'racer-rust/vim-racer'
" Extra highlighting of typedefs, enumerations etc (based on ctags)
Plugin 'vim-scripts/TagHighlight.git'
" Vim uses current virtualenv.
Plugin 'jmcantrell/vim-virtualenv'
" The ultimate undo history visualizer for VIM
Plugin 'mbbill/undotree'
" Show git status in gutter.
Plugin 'airblade/vim-gitgutter'
" Enhanced splash screen with RUFs.
Plugin 'mhinz/vim-startify'
" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular'
" Proper markdown formatting.
Plugin 'plasticboy/vim-markdown'
" Reveal the current file in the OS X Finder.
Plugin 'henrik/vim-reveal-in-finder'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'
" Decrease reliance on single-key navigation.
Plugin 'takac/vim-hardtime'
" Highlight trailing whitespace.
Plugin 'bronson/vim-trailing-whitespace'
" Ag in Vim
Plugin 'rking/ag.vim'
" distraction-free writing
Plugin 'junegunn/goyo.vim'
" paragraph highlighting for the above
Plugin 'junegunn/limelight.vim'
" Syntax highlighting for JSON in Vim
Plugin 'elzr/vim-json'
" ES6 support
Plugin 'isRuslan/vim-es6'
" Better Python syntax: http://www.vim.org/scripts/script.php?script_id=790
" [in ~/.vim/syntax folder]
"
" Colour schemes
Plugin 'sickill/vim-monokai'
Plugin 'morhetz/gruvbox.git'
Plugin 'rakr/vim-one'


call vundle#end()            " required
filetype plugin indent on    " required

" NeoVim Python hosts
let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'

" ==============================================================================
" ==== Setup ===================================================================
set shell=zsh\ -l               " just so we're clear, vim
set background=dark             " against a dark background
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

" ==== Search ==================================================================
set incsearch                   " show matches while you type
set hlsearch                    " highlight matches
set ignorecase                  " search case insensitive
set smartcase                   " search case-sensitive when uppercase characters appear in search
                                " magic by default
nnoremap / /\v
                                " magic by default
cnoremap %s/ %s/\v

" ---- ag.vim ------------------------------------------------------------------
                                " alt-0 (º) is remapped to find all instances
                                " of the word under the cursor within the
                                " current working directory
nmap º :Ag <c-r>=expand("<cword>")<cr><cr>
                                " space-/ is remapped to 'Ag'
nnoremap <space>/ :Ag 


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
set colorcolumn=81,161          " indicate col80, col161
" set foldenable                " automatic code folding is the devil's work

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


" ==== Statusline / Syntastic ==================================================
if has('statusline')
    set laststatus=2                " last window always has a status line
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 1   " check files when opened
let g:syntastic_check_on_wq = 0     " don't check files on close
                                    " using gcc and cppcheck on C
let g:syntastic_c_checkers = ['gcc', 'cppcheck']
                                    " clang++ is our cxx compiler
let g:syntastic_cpp_compiler = 'clang++'
                                    " and we always use:
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
                                    " check python with pylint
let g:syntastic_python_checkers = ['python', 'pylint']

" ==== YouCompleteMe ===========================================================
" Path to rust source, which should be the same as the rust-src component
" path.
let g:ycm_rust_src_path = $HOME.'/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

" ==== flake8 ==================================================================
let g:flake8_cmd=$HOME.'/.virtualenvs/core/bin/flake8'

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
