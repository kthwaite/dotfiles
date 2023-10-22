--------------------------------------------------------------------------------
return {
    {
        "mfussenegger/nvim-lint",
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                lua = { "lua_ls" },
                python = { "pyright", "ruff_lsp" },
            }
        end,
    },
    {
        "mhartington/formatter.nvim",
        config = function()
            -- Utilities for creating configurations
            local util = require("formatter.util")
            local defaults = require("formatter.defaults")
            require("formatter").setup({
                logging = true,
                log_level = vim.log.levels.WARN,
                -- All formatter configurations are opt-in
                filetype = {
                    lua = {
                        require("formatter.filetypes.lua").stylua,
                    },
                    python = {
                        require("formatter.filetypes.python").isort,
                        require("formatter.filetypes.python").black,
                    },
                    rust = {
                        require("formatter.filetypes.rust").rustfmt,
                    },
                    sql = {
                        require("formatter.filetypes.sql").sqlfluff,
                    },
                    typescript = {
                        util.withl(defaults.prettier, "typescript")
                    },
                    typescriptreact = {
                        util.withl(defaults.prettier, "typescript")
                    },
                    javascript = {
                        util.withl(defaults.prettier, "javascript")
                    },
                    javascriptreact = {
                        util.withl(defaults.prettier, "javascript")
                    },
                },
            })
        end,
    },
}
