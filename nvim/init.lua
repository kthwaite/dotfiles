--------------------------------------------------------------------------------
-- # basic setup
require("00_setup")
-- Falls DSL config
vim.filetype.add({ extension = { fall = "falls" } })
--------------------------------------------------------------------------------
-- # plugins
require("01_plugins")
-- # mappings
require("02_maps")
