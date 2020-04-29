" ==== NERDTree ================================================================
let NERDTreeShowLineNumbers=1   " enable line numbers
let NERDTreeShowHidden=0        " display hidden files on startup
                                " make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
                                " invoke NERDTree with Ctrl-f
map <C-f> :NERDTreeToggle<CR>
