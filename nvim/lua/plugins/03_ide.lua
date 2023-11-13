local nnoremap = require("utility").nnoremap

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- @param client
-- @param bufnr
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    nnoremap("gD", vim.lsp.buf.declaration, opts)
    nnoremap("gd", vim.lsp.buf.definition, opts)
    nnoremap("K", vim.lsp.buf.hover, opts)
    nnoremap("gi", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    nnoremap("<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    nnoremap("<space>D", vim.lsp.buf.type_definition, opts)
    nnoremap("<space>rn", vim.lsp.buf.rename, opts)
    nnoremap("<space>ca", vim.lsp.buf.code_action, opts)
    nnoremap("gr", vim.lsp.buf.references, opts)
    nnoremap("[d", vim.diagnostic.goto_prev, opts)
    nnoremap("]d", vim.diagnostic.goto_next, opts)
    nnoremap("<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
end

local ls_opts = {
    ["ruff_lsp"] = function(opts)
        -- disable hover for ruff_lsp
        opts.on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            client.server_capabilities.hoverProvider = false
        end
    end,
    ["tsserver"] = function(opts)
        opts.cmd = { 'yarn', 'typescript-language-server', '--stdio' }
    end,
    ["eslintls"] = function(opts)
        opts.settings = {
            format = { enable = true },
        }
    end,
    ["lua_ls"] = function(opts)
        local runtime_path = vim.split(package.path, ";", {})
        table.insert(runtime_path, "lua/?.lua")
        table.insert(runtime_path, "lua/?/init.lua")
        opts.settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    end,
}

local dap_setup = {
    ["python"] = function(mason_registry, dap)
        local ok, debugpy = pcall(mason_registry.get_package, "debugpy")
        if not ok then
            vim.notify("Failed to locate package 'debugpy'", vim.log.levels.WARN)
            return
        end
        local debugpy_path = debugpy:get_install_path()
        dap.adapters.python = {
            type = "executable",
            command = debugpy_path .. "/debugpy-adapter",
        }
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",

                program = "${file}",
                pythonPath = function()
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                        return cwd .. "/.venv/bin/python"
                    else
                        return "python"
                    end
                end,
            },
        }
    end,
}

return {
    --------------------------------------------------------------------------------
    -- # LSP config
    -- nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                        },
                    },
                },
            },
            "williamboman/mason-lspconfig.nvim",
            "nvimtools/none-ls.nvim"
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = { "lua_ls" },
            })

            mason_lspconfig.setup_handlers({
                function(server_name) -- default handler
                    local default_caps = vim.lsp.protocol.make_client_capabilities()
                    local opts = {
                        on_attach = on_attach,
                        capabilities = require("cmp_nvim_lsp").default_capabilities(default_caps),
                    }
                    if ls_opts[server_name] then
                        ls_opts[server_name](opts)
                    end
                    require("lspconfig")[server_name].setup(opts)
                    vim.cmd([[ do User LspAttachBuffers ]])
                end,
            })
            vim.lsp.handlers["textDocument/publishDiagnostics"] =
                vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    virtual_text = {
                        spacing = 5,
                        prefix = "",
                    },
                    signs = false, -- rely on highlight styles instead, don't want to clobber signcolumn
                })
            local null_ls = require('null-ls')
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettier,
                }
            })
        end,
    },
    --------------------------------------------------------------------------------
    -- # git
    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        lazy = true,
        event = "BufEnter",
        opts = {
            on_attach = function(bufnr)
                local function map(mode, lhs, rhs, opts)
                    opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
                    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
                end

                -- Navigation
                map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
                map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

                -- Actions
                map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
                map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
                map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
                map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
            end,
        },
    },
    --------------------------------------------------------------------------------
    -- # treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = true,
        ft = {
            "python",
            "lua",
            "wgsl",
            "bash",
            "markdown",
            "vim",
            "typescript",
            "typescriptreact",
            "javascript",
            "javascriptreact",
        },
        cmd = { "TSInstall" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "python",
                    "wgsl",
                    "lua",
                    "bash",
                    "markdown",
                    "regex",
                    "vim",
                    "javascript",
                    "typescript",
                },
                highlight = {
                    enable = true,
                },
            })
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            --[[
            parser_config.falls = {
                install_info = {
                    url = "~/Source/_projects/falls/tree-sitter-falls", -- local path or git repo
                    files = { "src/parser.c" },
                    -- optional entries:
                    -- branch = "main", -- default branch in case of git repo if different from master
                    -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
                    -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
                },
                filetype = "falls", -- if filetype does not match the parser name
            }
            ]]
        end,
    },
    -- splitting/joining blocks of code using treesitter
    -- "kowansmer/treesj"
    --------------------------------------------------------------------------------
    -- # completion
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
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
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
    -- # completion sources
    "hrsh7th/cmp-path",         -- Path plugin for nvim-cmp
    "hrsh7th/cmp-cmdline",      -- Command-line plugin for nvim-cmp
    "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
    "saadparwaiz1/cmp_luasnip", -- Snippets for nvim-cmp
    "hrsh7th/cmp-buffer",       -- nvim-cmp source for buffer words.
    -- lua snippet engine
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        -- version = "<CurrentMajor>.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },
    --------------------------------------------------------------------------------
    -- # debug adapter protocol
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
        lazy = true,
        config = function()
            local dap = require("dap")
            local mason_registry = require("mason-registry")
            for _, setup in pairs(dap_setup) do
                setup(mason_registry, dap)
            end
        end,
    },
    --------------------------------------------------------------------------------
    -- # outlines and navigation
    -- error summaries
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        cmd = { "Trouble", "TroubleToggle" },
        keys = {
            { "<leader>te", "<cmd>TroubleToggle<CR>" },
        },
    },
    -- symbol outline
    {
        "simrat39/symbols-outline.nvim",
        opts = {},
    },
    -- highlight TODO, FIXME etc
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
        cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble" },
        opts = {},
    },
    --------------------------------------------------------------------------------
    -- # copilot
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
    --------------------------------------------------------------------------------
    -- # misc
    {
        "simrat39/rust-tools.nvim",
        ft = { "rust" },
    },
    {
        "lark-parser/vim-lark-syntax",
        ft = { "lark" },
    },
    -- nested zip support for yarn-pnp
    {
        "lbrayner/vim-rzip",
        ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
    },
}
