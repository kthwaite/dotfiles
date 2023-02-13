--------------------------------------------------------------------------------
-- # tree-sitter
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    ft = { "python", "lua", "falls" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "vim", "help" },
            highlight = {
                enable = true,
            },
        })
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.falls = {
            install_info = {
                url = "~/Source/_projects/falls/tree-sitter-falls", -- local path or git repo
                files = { "src/parser.c" },
                -- optional entries:
                -- branch = "main", -- default branch in case of git repo if different from master
                -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
                -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
            },
            filetype = "falls", -- if filetype does not match the parser name
        }
    end,
}
