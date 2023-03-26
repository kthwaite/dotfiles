local nnoremap = require("utility").nnoremap

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

return {
	--------------------------------------------------------------------------------
	-- # mason
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
	--------------------------------------------------------------------------------
	-- # mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function()
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
		end,
	},
	"simrat39/rust-tools.nvim",
	"neovim/nvim-lspconfig",
}
