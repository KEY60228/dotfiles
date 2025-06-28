-- Key mappings
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })

-- Search settings
vim.opt.hlsearch = true

-- Clipboard settings
vim.opt.clipboard = 'unnamed'

-- Cmd + s to save file
vim.keymap.set({ 'n', 'i' }, '<M-s>', '<cmd>w<CR>', { desc = 'Save File' })

-- Cmd + w to close buffer
vim.keymap.set({ 'n', 'i' }, '<M-w>', '<cmd>bd<CR>', { desc = 'Close Buffer' })

-- 24 Bit RGB Color
vim.api.nvim_set_option('termguicolors', true)

-- Scroll Buffer
vim.api.nvim_set_option('scrolloff', 4)

-- search option
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('smartcase', true)

-- %s search
vim.api.nvim_set_option('inccommand', 'split')

-- row number
vim.api.nvim_win_set_option(0, 'number', true)

-- signcolumn
vim.api.nvim_win_set_option(0, 'signcolumn', 'yes:1')

-- make tab width 2 with space
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = '*',
  callback = function()
    vim.api.nvim_buf_set_option(0, 'tabstop', 2)
    vim.api.nvim_buf_set_option(0, 'shiftwidth', 0)
    vim.api.nvim_buf_set_option(0, 'expandtab', true)
  end,
})

-- set leader key
vim.api.nvim_set_var('mapleader', ',')
vim.api.nvim_set_var('maplocalleader', '\\')

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

