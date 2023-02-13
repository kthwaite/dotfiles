return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	--    { "<leader>ft", "<cmd>Neotree toggle<CR>", desc = "Neotree" },
	config = {
		filesystem = {
			follow_current_file = true,
			hijack_netrw_behavior = "open_current",
		},
	},
}
