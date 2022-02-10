set nocompatible
scriptencoding utf-8
" === plugins =========================================================================
lua require('plugins')
" === basic config ====================================================================
lua require('00_setup')
" === plugin config ===================================================================
lua require('0X_alpha')
lua require('0X_lualine')
lua require('0X_nvim-tree')
lua require('0X_gitsigns')
lua require('0X_lsp_installer')
lua require('0X_telescope')
