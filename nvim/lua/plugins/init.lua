return {
	-- surround-marks made simple
	{
		"tpope/vim-surround",
		event = "InsertEnter",
	},
	-- nested zip support for yarn-pnp
	"lbrayner/vim-rzip",
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
	-- highlight TODO, FIXME etc
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
		cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble" },
		opts = {},
	},
}
