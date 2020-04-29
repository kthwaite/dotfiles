set nocompatible              " be iMproved, required

" ==== vim-plug ================================================================
call plug#begin('~/.vim/plugged')

source $HOME/.dotfiles/vim/00_plugins.vim

call plug#end()            " required

" NeoVim Python host(s)
let g:python3_host_prog='python'

" ==== setup ===================================================================
source $HOME/.dotfiles/vim/01_setup.vim

" ==== Plugin-specific config ==================================================
source $HOME/.dotfiles/vim/0X_airline.vim
source $HOME/.dotfiles/vim/0X_coc.vim
source $HOME/.dotfiles/vim/0X_fzf.vim
source $HOME/.dotfiles/vim/0X_goyo.vim
source $HOME/.dotfiles/vim/0X_nerdtree.vim
source $HOME/.dotfiles/vim/0X_startify.vim

" ==== misc ====================================================================
" ---- vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
" ---- vim-json
let g:vim_json_syntax_conceal = 0
