vim.cmd [[
    set nocompatible
]]
-- # plugins
require('plugins')
-- # basic setup
require('00_setup')
-- # plugin config
-- language server / debug adapter / linter package manager
require('0X_mason')
-- linter server
require('0X_null_ls')
-- pure-lua statusline
require('0X_lualine')
-- file tree
require('0X_nvim-tree')
-- git gutter config
require('0X_gitsigns')
-- universal search
require('0X_telescope')
-- startup screen
require('0X_alpha')
