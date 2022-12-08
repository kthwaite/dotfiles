vim.cmd [[
    set nocompatible
]]
-- plugins
require('plugins')
-- basic setup
require('00_setup')
-- plugin config
require('0X_mason')
require('0X_lualine')
require('0X_nvim-tree')
require('0X_gitsigns')
require('0X_telescope')
require('0X_alpha')
