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

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

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
    -- use 'airblade/vim-gitgutter'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
end)
