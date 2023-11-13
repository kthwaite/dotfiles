return {

	--------------------------------------------------------------------------------
	-- # neo-tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
		lazy = true,
		cmd = "Neotree",
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = true,
				hijack_netrw_behavior = "open_current",
			},
		},
	},
	-- surround-marks made simple
	{
		"tpope/vim-surround",
		event = "InsertEnter",
	},
	-- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
	{
		"folke/neodev.nvim",
		opts = {},
	},
    -- register peeking
    "gennaro-tedesco/nvim-peekup",

	--------------------------------------------------------------------------------
	-- # disabled
	-- A plugin for profiling Vim and Neovim startup time.
	-- "dstein64/vim-startuptime"
	-- Distraction-free coding for Neovim
	-- "folke/zen-mode.nvim"
	-- "folke/twilight.nvim"
}
