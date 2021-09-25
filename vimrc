
set nocompatible " be iMproved, required

call plug#begin('~/.vim/plugged')
source $HOME/.dotfiles/vim/00_plugins.vim
call plug#end()

" neovim Python hosts
let g:python3_host_prog='python3'

set clipboard=unnamed

source $HOME/.dotfiles/vim/01_setup.vim

" ==== plugins ================================================================
source $HOME/.dotfiles/vim/0X_startify.vim
source $HOME/.dotfiles/vim/0X_airline.vim
source $HOME/.dotfiles/vim/0X_nerdtree.vim
" source $HOME/.dotfiles/vim/0X_coc.vim
source $HOME/.dotfiles/vim/0X_lsp_installer.vim
source $HOME/.dotfiles/vim/0X_fzf.vim

