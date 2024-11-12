function Map(mode, lhs, rhs, opts) local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- SET THE Ö KEY TO MATCH AMERICAN
Map({"n", "v"}, "ö", ":")
Map({"n", "v"}, "Ö", ";")

-- MOVING BETWEEN START AND END OF LINE EASIER
Map({"n", "v", "o"}, "H", "^")
Map({"n", "v", "o"}, "L", "$")
Map({"n", "v", "o"}, "¤", "$")

-- UNBINDING THE ARROW KEYS
Map({"n", "v", "o", "i"}, "<Up>", "<nop>")
Map({"n", "v", "o", "i"}, "<Down>", "<nop>")
Map({"n", "v", "o", "i"}, "<Left>", "<nop>")
Map({"n", "v", "o", "i"}, "<Right>", "<nop>")

-- REPLICATE C-t BEHAVIOUR FROM VsVIM
Map({"n", "o", "v"}, "<C-t>", "<C-o>")

-- CLEAR SEARCH HIGHLIGHT WHEN <Esc> IS PRESSED
Map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- OPEN NETRW FAST
Map("n", "<leader>pv", vim.cmd.Ex)

-- TELESCOPE AND CONFIG
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
