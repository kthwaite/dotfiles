return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = {
		options = {
			icons_enabled = true,
			disabled_filetypes = {},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { "filename" },
			lualine_x = { [[%{&filetype!=#''?&filetype:'none'}]] },
			lualine_y = {
				[=[%{strlen(&fenc)?&fenc:&enc}[%{&fileformat}]]=],
				{
					"diagnostics",
					diagnostics_color = {},
					symbols = { warn = " W:", hint = " H:", info = " I:" },
				},
			},
			lualine_z = { { "%p%% L:%3l/%L C:%c", padding = { left = 1, right = 1 } } },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	},
}
