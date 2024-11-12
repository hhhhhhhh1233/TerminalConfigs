-- LEADER KEY IS <SPACE>
vim.g.mapleader = " "

require("config.lazy")
require("options")
require("keybindings")

-- Theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
