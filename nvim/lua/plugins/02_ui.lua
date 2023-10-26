return {
    --------------------------------------------------------------------------------
    -- # colorschemes
    {
        "tanvirtin/monokai.nvim",
        -- set up the colorscheme lazily
        opts = function()
            vim.cmd.colorscheme("monokai")
        end,
    },
    --------------------------------------------------------------------------------
    -- # UI elements

    {
        "stevearc/dressing.nvim",
        -- lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
                format = {},
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                lsp_doc_border = true,
            },
        },
        keys = {
            {
                "<S-Enter>",
                function()
                    require("noice").redirect(vim.fn.getcmdline())
                end,
                mode = "c",
                desc = "Redirect Cmdline",
            },
        },
    },
    --------------------------------------------------------------------------------
    -- # startup screen
    {
        "goolord/alpha-nvim",
        config = function()
            local alpha = require("alpha")
            local startify = require("alpha.themes.startify")
            local version_string = require("utility").version_string
            local section = startify.section
            -- Set header
            local header = {
                type = "text",
                val = {
                    "          .;CCC CCCC`<CCC>' ,<CCCCCC>>''.;C>>'''`<CCCCCC><CCC;<C>',<CCC",
                    "        . <CCCC, <CC>;,.,;<CCCC>>''.;<>,,,. -CCCC;.``''.;<C>>''',<CCC>",
                    "       <C;,CCCCC>.`C>'''''''  --<>;.``''<<<C;.`<<<CCCCCC>,;;<CCCCCCCC>;,",
                    "     ,CCCCCCCCC>' . `<C>' .,,zc,`<CCCC, -;.``<<>;<CCCCCCCCCC>>''''''<>'",
                    "    .<CCCCC''' zc$$$ccccc$$$$$$$h,.`<<C> <CCC;,,.``<`'CC>' .;<CCCCCC-",
                    "     ,CCCC' ,c$$$$$$$$$$$$$$$$$$$$$$cc,.  `'<<CCCCCCCCC,,<C`<CCC>>'    .,.",
                    "    ;CCCC' J$$$$$$$$$$$$$$$$$$$$$$$$$$$$$. `<>;,.```<<<<<CCC CC,.,,,;CC>'",
                    " .;C><C> z$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$. .`'<<<>>;,, <CC CCCCCCCCCC,,.",
                    "<C' `>   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$c CC>>;;, <C> CC,`CC>>'`'CCCCC",
                    "' ;C>;> J$$$$$$$$$$$$$$$$$$$$$$$$$????????$$$.`C''''<><>', CC,.,;;C>'`<CCC",
                    "  <CCC  $$$$$$$$$$$$$$$$$$$$$P\"  .,ccccccc$$$$. ,CCC>;,;<C,.``'''  ,<> .,'",
                    " ,CCC .<$$$$$$$$$$$$$$$$$$$$\"  zJ$$$$$$$$$$$$$$c <CCCC`<CCCCCCCCC>,`CC'<'",
                    ",CCC ; J$$$$$$$$$$$$$$$$$$$$,c$$??C????\"\"???$$$$hc`'>' ;.``<CC>>><C C> C>",
                    'CC>>;C ?$$$$$???????$$$$$$$$$$$FJP",c==="   J$$$$$c ;, <CC> <C><\\<> C>;CC;',
                    '>  >\' . $$P".,,zzcc, "$$$$$$$$$;" ,.    $" J$$$$$$$ <C> CCC <C < > <C `CCC',
                    ";<CCCC .`$,J$$$PCCC>?<C$$$$$$$$L -??    ,c$$$$$$$$$c C',CC> <' C,,;>   `CC",
                    'CCCC>\',C ?$$CCJ?""\'_`,`"$$$$$$$$$c,=cccd$$$$$$$$$$$$ C <C>  ,; C <>     `C',
                    'CCCC;,> .`$$$",==""-.  c<$$$$$$$$$$JJJJC?$$$$$$$$$$$ < CC < CC C,`>      `',
                    "CCCCCC;<C,`$F' .    `,JC:<$$$$$$$$$$$$$$$$$$$$$$$$$$>` <>-C CC,`C,`,.",
                    "`<C>`'CCCC,`h.,..,,,c$3C>:3$$$$$$$$$$$$$$$$$$$$$$$$$$ < <,<><`C;.`, <> .",
                    "    <C`<CC> $$$$$$$$$$$CC;<$$$$$$$$$$$$$$$$$$$$$$$$$$r`<;CCCCCCC>.' <> C;,",
                    "  ;CCC. CC>-`$$$$$$$$$$$CC:$$$$$$$$$?$$$$$$$$$$$$$$$$$.`<'`<CCCC>',C' <CCC",
                    "  <CC',<>',;.?$$$$$$$$$$C>;$$$$$9???-<$$$$$$$$$$$$$$$$$c,`-.``---''.,CCC>>",
                    ",C'CCCC ;.`C> $$$$$$$$$$$>`$$$$$F<;,c$$$$$$$$$$$$$$$$$$$$L `C>>;;<CCCCCCCC",
                    "C> CC>C,`C,`> `?$$$$$$$$$h;` `\"'.<$$$$$$$$$$$$$$$$$$$$$$$P . CCCCC,.;;.`''",
                    "'  `C `C;CC,CC; \"$$$$$$$$$$$$$$$$<$$$$$$$$$$$$$$$$$$$$$$P' C,`CCCCCCCCCCCC",
                    '    `C,.``<CCCCC, ?$$$$$$$$$$$????""\'"""" J$$$$$$$$$$$$" ..`C,C>`<<<<>>\'\'<',
                    "     `CCCC;.``<CC>.`$$$$$$$???     .,c=:c$$$$$$$$$$$$P',$'< CC'C;  <CCCC>;",
                    '       <CCCCC>, `CC, "$$$$$hcc,"?C????JJ$$$$$$$$$$$$",J$$ C CC <C . ``\'\',.',
                    "          `C>`CC,`<CC, \"$$$$$$$$$$>;;??$$$$$$$$$$$P',$$$$ C CC> C,`C;. <CC",
                    '         .,CC,`<C,,CCC .`?$$$$$$$$JJ$$$$$$$$$$$$P",J$$$$F.>,CC><CC CCC> <C',
                    "       ;C>'CCC>.`<'<CC $c, ?$$$$$$$$$$$$$$$$$$$\" c$$$$$$ <><C> <CC ``<C;.`",
                    "      ,CC> `CCCCCCCCC',$$$h.`?$$$$$$$$$$$$$$$\" z$$$$$$$F;CC>',<CC>,C>.`<C;",
                    "      <C> <>.`'''<>'  $$$$$$$c \"$$$$$$$$$??\".z$$$$$$$$$ `\".;<CCC> .`<C; CC",
                    "      CC <CCC <C'<Cr J$$$$$$$$$c,``''\"\"'.zc$$$$$$$$$$$F;;CCCCC>' ;C, <CCCC",
                    "     <CC C><C CC CCC $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ CCCC>' .c;`<C> C <C",
                    " ",
                },
                opts = {
                    position = "center",
                },
            }
            section.mru.opts = { position = "center" }
            startify.opts.layout = {
                { type = "padding", val = 1 },
                header,
                { type = "text",    val = "NVIM" .. version_string(), opts = { position = "center" } },
                { type = "padding", val = 1 },
                section.top_buttons,
                { type = "group",   val = { section.mru }, opts = { position = "center" } },
                section.mru_cwd,
                { type = "padding", val = 1 },
                section.bottom_buttons,
                section.footer,
            }
            startify.section.header.opts.hl = "#33ff33"
            alpha.setup(startify.config)
        end,
    },
    --------------------------------------------------------------------------------
    -- # statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
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
    },

    --------------------------------------------------------------------------------
    -- # telescope
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
}
