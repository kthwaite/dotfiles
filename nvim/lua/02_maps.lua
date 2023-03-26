local au = require("utility").au
local nnoremap = require("utility").nnoremap
-- # autocommands
-- autoformat buffer on write
au("BufWritePre", "*.py,*.lua,*.rs", function()
	vim.lsp.buf.format({ async = false })
end)
-- highlight text on yank
au("TextYankPost", "*", function()
	vim.highlight.on_yank({ higroup = "IncSearch", timeout = 350 })
end)

-- # binds
-- reload vimrc
nnoremap("<leader>sv", ":source $MYVIMRC<cr>")
-- close hidden buffers
nnoremap("<leader>Bd", ":up | %bd | e#")

-- ==== Plugins ===============================================================
-- # neotree
-- toggle neotree
nnoremap("<leader>ft", ":Neotree toggle<CR>")
-- # telescope binds
nnoremap("<leader>tg", ":Telescope git_files<cr>")
nnoremap("<leader>tf", ":Telescope find_files<cr>")
nnoremap("<leader>tb", ":Telescope buffers<cr>")
nnoremap("<leader>to", ":Telescope oldfiles<cr>")
nnoremap("<leader>tr", ":Telescope registers<cr>")
nnoremap("<leader>tt", ":Telescope<cr>")
