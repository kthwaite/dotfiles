return {
    --------------------------------------------------------------------------------
    -- # cmp
    {
        "hrsh7th/nvim-cmp",
        version = false,
        lazy = true,
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            cmp.complete()
                        end
                    end, { "i", "c" }),
                    ["<C-n>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            cmp.complete()
                        end
                    end, { "i", "c" }),
                    ["<C-d>"] = cmp.mapping.scroll_docs( -4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({
                        --behavior = cmp.ConfirmBehavior.Replace,
                        --select = true,
                    }),
                },
                sources = {
                    { name = "vsnip" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "nvim_lsp" },
                },
            })
            cmp.setup.cmdline(":", {
                sources = { { name = "cmdline" } },
            })
        end,
    },
    --------------------------------------------------------------------------------
    -- # cmp sources
    "hrsh7th/cmp-path", -- Path plugin for nvim-cmp
    "hrsh7th/cmp-cmdline", -- Command-line plugin for nvim-cmp
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "saadparwaiz1/cmp_luasnip", -- Snippets for nvim-cmp
    "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words.
    -- lua snippet engine
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "<CurrentMajor>.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },
}
