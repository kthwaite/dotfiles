set nocompatible
" === plugins =============
lua require('plugins')
" 
source $HOME/.dotfiles/vim/01_setup.vim
" === plugin config =======
lua require('0X_alpha')
lua require('0X_lualine')
lua require('0X_nvim-tree')
lua require('0X_gitsigns')
lua require('0X_lsp_installer')
