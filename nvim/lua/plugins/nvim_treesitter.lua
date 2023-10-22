--------------------------------------------------------------------------------
-- # tree-sitter
return {
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
}
