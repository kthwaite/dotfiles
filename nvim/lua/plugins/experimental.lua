return {

    -- register peeking
    "gennaro-tedesco/nvim-peekup",
    --
    {
        "folke/neodev.nvim",
        opts = {},
    },
    -- ui elements
    {
        "stevearc/dressing.nvim",
        -- lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
    -- UI elements
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
                format = {},
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                lsp_doc_border = true,
            },
        },
        keys = {
            {
                "<S-Enter>",
                function()
                    require("noice").redirect(vim.fn.getcmdline())
                end,
                mode = "c",
                desc = "Redirect Cmdline",
            },
        },
    },
    {
        "simrat39/symbols-outline.nvim",
        opts = {},
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "rouge8/neotest-rust",
        },
        opts = {},
    },
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        cmd = "Copilot",
        opts = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = false,
                    keymap = {
                        accept = "<C-l>",
                        accept_word = false,
                        accept_line = false,
                        next = "<C-]>",
                        prev = "<C-[>",
                        dismiss = "<C-c>",
                    },
                },
                filetypes = {
                    javascript = true,
                    typescript = true,
                    javascriptreact = true,
                    typescriptreact = true,
                    rust = true,
                    python = true,
                    lua = true,
                    falls = true,
                    ["*"] = false,
                },
            })
            require("copilot.api").register_status_notification_handler(function(data)
                print("Copilot Status: " .. data.status)
            end)
        end,
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
    ]]
    --[[
    --
    -- splitting/joining blocks of code using treesitter
    kowansmer/treesj
    -- A plugin for profiling Vim and Neovim startup time.
    dstein64/vim-startuptime
    -- 'Automatically expand width of the current window. Maximizes and restore it. And all this with nice animations!'
    anuvyklack/windows.nvim
    -- Distraction-free coding for Neovim
    folke/zen-mode.nvim
    folke/twilight.nvim
    ]]
    --
}
