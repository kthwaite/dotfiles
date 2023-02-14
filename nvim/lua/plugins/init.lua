return {
	-- # colorschemes
	{
		"tanvirtin/monokai.nvim",
		event = "VeryLazy",
		opts = function()
			vim.cmd.colorscheme("monokai")
		end,
	},

	{
		-- surround-marks made simple
		"tpope/vim-surround",
		event = "InsertEnter",
	},

	{
		-- nested zip support for yarn-pnp
		"lbrayner/vim-rzip",
		ft = { "javascript", "javascriptreact" },
	},

	{
		-- vim-slime
		"jpalardy/vim-slime",
		event = "VeryLazy",
	},

	-- # diagnostics
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		cmd = { "Trouble", "TroubleToggle" },
		keys = {
			{ "<leader>te", "<cmd>TroubleToggle<CR>" },
		},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
		},
		cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble" },
		opts = {},
	},
}
