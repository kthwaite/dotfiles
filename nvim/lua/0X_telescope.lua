local map = vim.api.nvim_set_keymap
map('n', '<leader>tg', ':Telescope git_files<cr>', {noremap=true})
map('n', '<leader>tf', ':Telescope find_files<cr>', {noremap=true})
map('n', '<leader>tb', ':Telescope buffers<cr>', {noremap=true})
map('n', '<leader>to', ':Telescope oldfiles<cr>', {noremap=true})
map('n', '<leader>tr', ':Telescope registers<cr>', {noremap=true})
map('n', '<leader>tt', ':Telescope<cr>', {noremap=true})
