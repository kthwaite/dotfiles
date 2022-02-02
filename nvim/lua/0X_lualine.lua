require('lualine').setup {
  options = {
    icons_enabled = true,
    -- theme = bubblegum,
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {[[%{&filetype!=#''?&filetype:'none'}]]},
    lualine_y = {[=[%{strlen(&fenc)?&fenc:&enc}[%{&fileformat}]]=],
        {
            'diagnostics',
            diagnostics_color = {
                -- error = { bg = '#e32636', fg = colors.med_gray_lo },
                -- warn = { bg = '#ffa500', fg = colors.med_gray_lo },
            },
            symbols = { warn = ' W:', hint = ' H:', info = ' I:' }
        }
    },
    lualine_z = {{'%p%% L:%3l/%L C:%c', padding={left = 1, right=1}}}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
