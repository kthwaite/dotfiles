-- # plugins
require("plugins")
-- # basic setup
require("00_setup")
-- # plugin config
-- language server / debug adapter / linter management
require("0X_lsp")
-- UI customization
require("0X_ui")
-- git gutter config
require("0X_gitsigns")
-- universal search
require("0X_telescope")
