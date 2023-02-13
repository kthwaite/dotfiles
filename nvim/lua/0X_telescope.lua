local nnoremap = require("utility").nnoremap

nnoremap("<leader>ff", function()
    require("telescope.builtin").find_files()
end)
