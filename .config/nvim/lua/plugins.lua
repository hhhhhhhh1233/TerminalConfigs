return {
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim'}, opts = { signs = false }},
	{'windwp/nvim-autopairs', event = "InsertEnter", config = true }, 
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ "williamboman/mason.nvim" },
}
