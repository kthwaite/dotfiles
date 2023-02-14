--------------------------------------------------------------------------------
-- # tree-sitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = true,
	ft = { "python", "lua", "rust", "go" },
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "vim", "help", "python", "lua", "rust", "go" },
			highlight = { enable = true },
		})
	end,
}
