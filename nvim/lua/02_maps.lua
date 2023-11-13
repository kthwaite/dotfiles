local au = require("utility").au
local nnoremap = require("utility").nnoremap
-- # autocommands
-- autoformat buffer on write
local fmt_group = vim.api.nvim_create_augroup("kt_fmt", { clear = true })
au("BufWritePre", "*.py,*.lua,*.rs,*.sql,*.js,*.jsx,*.ts,*.tsx", function()
    vim.lsp.buf.format({ async = true })
end, { group = fmt_group })
-- highlight text on yank
local util_group = vim.api.nvim_create_augroup("kt_util", { clear = true })
au("TextYankPost", "*", function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 350 })
end, { group = util_group })

-- # binds
-- reload vimrc
nnoremap("<leader>sv", ":source $MYVIMRC<cr>")
-- close hidden buffers
nnoremap("<leader>Bd", ":up | %bd | e#<cr>")

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
