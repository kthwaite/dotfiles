vim.cmd [[
    syntax on
    colorscheme monokai
    set clipboard=unnamedplus
    let g:slime_target="tmux"
]]

-- ==== Prelims
local map = vim.api.nvim_set_keymap
local nnoremap = function(capt, repl)
    map('n', capt, repl, {noremap=true})
end
local noremap = function(capt, repl)
    map('', capt, repl, {noremap=true})
end
vim.g.mapleader = ' '

-- ==== Setup ===================================================================
-- local vim = require('vim')
vim.opt.shell = 'zsh -l'
vim.opt.termguicolors = true
vim.opt.encoding='utf-8'            -- default encoding is utf-8
vim.opt.fileformats='unix,dos,mac'  -- prefer Unix over Windows over OS 9 formats
vim.opt.history=1000                -- 1000 lines of history
vim.o.shortmess=vim.o.shortmess..'filmnrxoOtT'      -- [noeol], 00L/00C, [+], [New], [RO], [unix]

vim.opt.autoread=true               -- auto-reload modified files
vim.opt.swapfile=false              -- no swapfile
vim.opt.backup=false                -- no backup files
vim.opt.bs='indent,eol,start'       -- backspace over everything!
vim.opt.ruler=true                  -- display cursor position
vim.opt.lazyredraw=true             -- faster macro invocation
vim.opt.title=true                  -- set window title
vim.opt.titlestring='%t'            -- ibid
-- current directory is always window-local
vim.cmd [[autocmd BufEnter * lcd %:p:h]]

-- ==== Search ==================================================================
vim.opt.incsearch=true              -- show matches while you type
vim.opt.hlsearch=true               -- highlight matches
vim.opt.ignorecase=true             -- search case insensitive
vim.opt.smartcase=true              -- search case-sensitive when uppercase characters appear in search
-- search magic by default
map('n', '/', '/\\v', {noremap=true})
-- search magic by default
map('c', '%s/', '%s/\\v', {noremap=true})
-- yank
map('n', 'Y', 'y$', {noremap=true})

-- enable mouse
-- hide mouse cursor while typing
vim.cmd [[
    set mouse=a
    set mousehide
]]

-- ==== Formatting ==============================================================
vim.opt.wrap=true                           -- wrap lines
vim.opt.autoindent=true		                -- keep prev indent
vim.opt.smartindent=true                    -- smart autoindenting
vim.opt.smarttab=true                       -- insert shiftwidth blanks
vim.opt.shiftwidth=4	                    -- width of shift, spaces
vim.opt.softtabstop=4                       -- number of tab-spaces while editing
vim.opt.expandtab=true 		                -- tabs are spaces
vim.opt.tabstop=4		                    -- tabs are worth 4 spaces

-- ==== UI ======================================================================
vim.opt.cursorline=true 		            -- highlight current line
vim.opt.showmode=true 		                -- show current mode
vim.cmd [[highlight clear LineNr]]          -- highlight the current line number
vim.cmd [[highlight clear SignColumn ]]     -- highlight gutter symbols
vim.opt.number=true                         -- line numbers on
vim.opt.relativenumber=true                 -- for fast vertical movement
vim.opt.linespace=0                         -- no extra spaces between rows
                                            -- mkview preserves EVERYTHING
vim.cmd [[set vop=cursor,folds,options,slash,unix ]]
vim.opt.virtualedit='onemore'               -- cursor after EOL
vim.opt.showmatch=true                      -- show search matches
vim.opt.wildmenu=true                       -- show list for autocomplete
vim.opt.wildmode='list:longest,full'        -- list all matches and complete
vim.opt.colorcolumn='88,161'                -- indicate col80, col161
vim.opt.foldenable=false                    -- automatic code folding is the devil's work

-- ==== Commands =================================================================
-- reload vimrc
map('n', '<leader>sv', ':source $MYVIMRC<cr>', {noremap=true})
-- remap esc to jk
map('i', 'jk', '<esc>', {noremap=true})
map('i', '<esc>', '<nop>', {noremap=true})
-- search

-- splits
-- remap split navigation
noremap('<C-h>','<C-w>h')
noremap('<C-j>', '<C-w>j')
noremap('<C-k>', '<C-w>k')
noremap('<C-l>', '<C-w>l')
-- horizontal split to vertical split
nnoremap('<leader>hv','<C-w>t<C-w>H')
-- vertical split to horizontal split
nnoremap('<leader>vh', '<C-w>t<C-w>K')
