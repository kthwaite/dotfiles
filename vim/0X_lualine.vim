lua << END
-- theme colours
local colors = {
    dark_gray = '#303030',
    med_gray_hi = '#444444',
    med_gray_lo = '#3a3a3a',
    light_gray = '#b2b2b2',
    green = '#afd787',
    blue = '#87afd7',
    purple = '#afafd7',
    orange = '#d7af5f',
    red = '#d78787',
    pink = '#d7afd7',
}
-- theme
local bubblegum = {
    normal = {
        a = { fg = colors.med_gray_hi, bg = colors.green, gui = 'bold', },
        b = { bg = colors.med_gray_lo, fg = colors.light_gray, },
        c = { fg = colors.green, bg = colors.med_gray_hi, }
    },
    insert = {
        a = { fg = colors.med_gray_hi, bg = colors.blue, gui = 'bold', },
        b = { bg = colors.med_gray_lo, fg = colors.light_gray, },
        c = { fg = colors.blue, bg = colors.med_gray_hi, }
    },
    visual = {
        a = { fg = colors.med_gray_hi, bg = colors.purple, gui = 'bold', },
        b = { bg = colors.med_gray_lo, fg = colors.light_gray, },
        c = { fg = colors.purple, bg = colors.med_gray_hi, }
    },
    replace = {
        a = { fg = colors.med_gray_hi, bg = colors.red, gui = 'bold', },
        b = { bg = colors.med_gray_lo, fg = colors.light_gray, },
        c = { fg = colors.red, bg = colors.med_gray_hi, }
    }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = bubblegum,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
                error = { bg = '#e32636', fg = colors.med_gray_lo },
                warn = { bg = '#ffa500', fg = colors.med_gray_lo },
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
END
