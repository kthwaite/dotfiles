-- Configuration for Mason, LSP servers, formatters, and DAP servers.
--
local nnoremap = require("utility").nnoremap
local au = require("utility").au
local utility = require("utility")

--------------------------------------------------------------------------------
-- # Mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
        },
    },
})

--------------------------------------------------------------------------------
-- # LSP setup
-- per-language-server options
local mason_lspconfig = require("mason-lspconfig")
local ls_opts = {
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
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    end,
}

mason_lspconfig.setup({
    ensure_installed = { "lua_ls" },
})

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
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        spacing = 5,
        prefix = "",
    },
    signs = false, -- rely on highlight styles instead, don't want to clobber signcolumn
})

--------------------------------------------------------------------------------
-- # cmp
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
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

--------------------------------------------------------------------------------
-- # null-ls
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.sql_formatter,
    },
})

--------------------------------------------------------------------------------
-- # dap
local dap = require("dap")
local mason_registry = require("mason-registry")
local dap_setup = {
    ["python"] = function()
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

for _, setup in pairs(dap_setup) do
    setup()
end

-- binds
au("BufWritePre", "*.py,*.lua", function()
    vim.lsp.buf.format({ async = true })
end)
au("TextYankPost", "*", function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 350 })
end)
