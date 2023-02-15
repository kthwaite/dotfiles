--------------------------------------------------------------------------------
-- # null-ls
return {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    ft = { "python", "lua", "rust" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.rustfmt,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.sql_formatter,
            },
        })
    end,
}
