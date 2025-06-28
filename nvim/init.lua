-- Key mappings
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })

-- Search settings
vim.opt.hlsearch = true

-- Clipboard settings
vim.opt.clipboard = 'unnamed'

-- my nvim settings
require("config.my")

-- lazy.nvim
require("config.lazy")

