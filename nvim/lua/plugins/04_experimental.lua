local neotest_ft = { 'rust' }
return {
    -- testing
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
        },
        ft = neotest_ft,
        opts = {},
        config = function()
            require('neotest').setup {
                adapters = {
                    require('neotest-rust')
                }
            }
        end
    },
    {
        "rouge8/neotest-rust",
        ft = neotest_ft,
    },
    -- coalesce vim-tmux navkeys
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    }
    --[[
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    ]] --
}
