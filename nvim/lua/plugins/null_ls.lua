--------------------------------------------------------------------------------
-- # null-ls
return {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    ft = { 'python', 'lua', 'rust' },
    config = function()
        local null_ls = require('null-ls')
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
            }
        })
    end
}
