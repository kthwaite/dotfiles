-- silence linter errors with local import
local use = require('packer').use

return require('packer').startup(function()
    -- packer has to manage itself.
    -- otherwise packer deletes itself.
    use 'wbthomason/packer.nvim'

    -- colorschemes
    use 'tanvirtin/monokai.nvim'
    use 'sainnhe/sonokai'

    -- QoL
    -- surround-marks made simple
    use 'tpope/vim-surround'
    -- commenting made simple
    use 'tpope/vim-commentary'
    -- display a popup with possible keybindings of the command you started typing
    use{
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

    -- distraction-free writing
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                on_open = function(_)
                    vim.cmd('Limelight')
                end,
                on_close = function(_)
                    vim.cmd('Limelight!')
                end,
            }
        end
    }
    use 'junegunn/limelight.vim'

    -- lualine
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- file browsenvim-tree-r
    use 'kyazdani42/nvim-tree.lua'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-buffer'   -- nvim-cmp source for buffer words.
    use 'hrsh7th/nvim-cmp'     -- Autocompletion plugin
    use 'hrsh7th/cmp-path'     -- Path plugin for nvim-cmp
    use 'hrsh7th/cmp-cmdline'  -- Command-line plugin for nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-vsnip'    -- Snippets for nvim-cmp
    use 'hrsh7th/vim-vsnip'
    -- nested zip support for yarn-pnp
    use 'lbrayner/vim-rzip'

    -- startup screen
    use 'goolord/alpha-nvim'

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        }
    }

    -- === experimental zone ===

    --A fancy, configurable, notification manager for NeoVim
    use 'rcarriga/nvim-notify'
    -- nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

end)
