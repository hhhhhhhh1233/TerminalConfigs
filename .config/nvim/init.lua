-- Basic Settings
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.g.mapleader = ' '

-- Remapping
vim.cmd('map ¤ $')
vim.cmd('map zp "+p')
vim.cmd('map zy "+y')
vim.cmd('map ö :')
vim.cmd('map ä _')
vim.cmd('tnoremap <Esc> <C-\\><C-n>')
vim.cmd('nnoremap <Up> <nop>') -- These are for good habits
vim.cmd('nnoremap <Down> <nop>')
vim.cmd('nnoremap <Left> <nop>')
vim.cmd('nnoremap <Right> <nop>')
vim.cmd('vnoremap <Up> <nop>')
vim.cmd('vnoremap <Down> <nop>')
vim.cmd('vnoremap <Left> <nop>')
vim.cmd('vnoremap <Right> <nop>')
vim.cmd('inoremap <Up> <nop>')
vim.cmd('inoremap <Down> <nop>')
vim.cmd('inoremap <Left> <nop>')
vim.cmd('inoremap <Right> <nop>')

-- Setting up Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- My Plugins
require("lazy").setup({
	{"nvim-treesitter/nvim-treesitter", build = ':TSUpdate'},
	{'folke/tokyonight.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{'L3MON4D3/LuaSnip'},
	{'windwp/nvim-autopairs', event = "InsertEnter", config = true }, 
	{'rust-lang/rust.vim'},
	{ 'mrcjkb/rustaceanvim', version = '^4', ft = { 'rust' }, },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },
	{'mfussenegger/nvim-dap'},
})

-- NVIM Theme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- Honestly no clue what this does
vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')

-- Telescope and config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- LSP
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Mason
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})

-- Save all of the fold on close and load on open
vim.api.nvim_create_autocmd({"BufWinLeave"}, {
	pattern = {"*.*"},
	desc = "save view (folds), when closing file",
	command = "mkview",
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
	pattern = {"*.*"},
	desc = "load view (folds), when opening file",
	command = "silent! loadview",
})
