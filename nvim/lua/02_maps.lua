local au = require("utility").au
-- binds
au("BufWritePre", "*.py,*.lua", function()
    vim.lsp.buf.format({ async = false })
end)
au("TextYankPost", "*", function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 350 })
end)

local nnoremap = require("utility").nnoremap
nnoremap("<leader>tg", ":Telescope git_files<cr>")
nnoremap("<leader>tf", ":Telescope find_files<cr>")
nnoremap("<leader>tb", ":Telescope buffers<cr>")
nnoremap("<leader>to", ":Telescope oldfiles<cr>")
nnoremap("<leader>tr", ":Telescope registers<cr>")
nnoremap("<leader>tt", ":Telescope<cr>")
