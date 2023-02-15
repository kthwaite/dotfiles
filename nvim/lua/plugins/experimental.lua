return {
	-- register peeking
	"gennaro-tedesco/nvim-peekup",
	-- new UI features
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				enabled = true,
				view = "cmdline_popup", -- or 'cmdline' for classic
				format = {
					-- search_down = { icon = "" },
				},
			},
			lsp = {
				override = {
					-- override LSP markdown formatter + docs
					["vim.lsp.util.convert_input_to_markdown_lines"] = false,
					["vim.lsp.util.stylize_markdown"] = false,
					["cmp.entry.get_documentation"] = false,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = false,
				lsp_doc_border = true,
			},
		},
		keys = {},
	},
	{
		"simrat39/symbols-outline.nvim",
		opts = {},
	},
}
