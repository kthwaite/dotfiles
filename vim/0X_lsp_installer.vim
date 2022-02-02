lua << EOF

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            else
                cmp.complete()
            end
        end, { 'i', 'c'}),
        ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item()
            else
                cmp.complete()
            end
        end, { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            --behavior = cmp.ConfirmBehavior.Replace,
            --select = true,
        },
    },
    sources = {
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp' },
    },
}
cmp.setup.cmdline(':', {
    sources = { { name = 'cmdline' } }
})

local lsp_installer = require 'nvim-lsp-installer'
local lsp_servers = require 'nvim-lsp-installer.servers'
local M = {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local function setup_handlers()
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                spacing = 5,
                prefix = '',
            },
            signs = false, -- rely on highlight styles instead, don't want to clobber signcolumn
        })
end

function M.setup()
    setup_handlers()
    vim.cmd [[ command! LspLog tabnew|lua vim.cmd('e'..vim.lsp.get_log_path()) ]]

    local ok, sumneko_lua = lsp_servers.get_server 'sumneko_lua'
    if ok then
        if not sumneko_lua:is_installed() then
            sumneko_lua:install()
        end
    end

    lsp_installer.on_server_ready(function(server)
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        if server.name == 'eslintls' then
            opts.settings = {
                format = { enable = true },
            }
        end

        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
    end)
end

M.setup()

EOF
