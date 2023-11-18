--------------------------------------------------------------------------------
-- # basic setup
require("00_setup")
--------------------------------------------------------------------------------
-- # plugins
require("01_plugins")
-- # mappings
require("02_maps")
-- # extras
-- falls DSL config
vim.filetype.add({ extension = { fall = "falls" } })
require("03_extras")
