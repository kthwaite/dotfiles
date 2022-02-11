-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- packer has to manage itself.
    -- otherwise packer deletes itself.
    use 'wbthomason/packer.nvim'

    -- colorschemes
    use 'tanvirtin/monokai.nvim'
    use 'arcticicestudio/nord-vim'
    use 'joshdick/onedark.vim'
    use 'morhetz/gruvbox'
    use 'rakr/vim-one'

    -- QoL
    use 'tpope/vim-surround'    -- surround-marks made simple
    -- use 'sheerun/vim-polyglot'  -- A solid language pack for Vim


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
