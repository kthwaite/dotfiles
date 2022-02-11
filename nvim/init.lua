vim.cmd [[
    set nocompatible
]]
-- === plugins =========================================================================
require('plugins')
-- === basic config ====================================================================
require('00_setup')
-- === plugin config ===================================================================
require('0X_alpha')
require('0X_line')
require('0X_nvim-tree')
require('0X_gitsigns')
require('0X_lsp_installer')
require('0X_telescope')
