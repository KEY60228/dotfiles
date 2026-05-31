-- Key mappings
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })

-- Search settings
vim.opt.hlsearch = true

-- Clipboard settings
-- OSC 52では * (primary selection) はmacOSに届かないため + を使う
vim.opt.clipboard = 'unnamedplus'

-- SSH接続時はOSC 52でクライアント側クリップボードに転送
if vim.env.SSH_TTY then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end

-- Cmd + a to select all
vim.keymap.set({ 'n', 'i' }, '<A-a>', '<ESC>ggVG', { desc = 'Select All' })

-- Cmd + s to save file
vim.keymap.set({ 'n', 'i' }, '<A-s>', '<cmd>w<CR>', { desc = 'Save File' })

-- Cmd + w to close buffer
vim.keymap.set({ 'n', 'i' }, '<A-w>', '<cmd>bd<CR>', { desc = 'Close Buffer' })

-- Command abbreviation: vd -> vert diffsplit
vim.cmd('cnoreabbrev vd vert diffsplit')

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

-- display diagnostic
vim.diagnostic.config({
  virtual_text = true
})

-- <C-w><C-h/j/k/l> でwindow resize、tmuxの `bind -r` 同様に押し続けで繰り返す
local function termcode(key)
  return vim.api.nvim_replace_termcodes(key, true, false, true)
end

local resize_actions = {
  [termcode('<C-h>')] = 'vertical resize -5',
  [termcode('<C-l>')] = 'vertical resize +5',
  [termcode('<C-j>')] = 'resize -5',
  [termcode('<C-k>')] = 'resize +5',
}

local function resize_window(initial_key)
  local cmd = resize_actions[termcode(initial_key)]
  if cmd then vim.cmd(cmd) end
  while true do
    vim.cmd('redraw')
    local ok, char = pcall(vim.fn.getcharstr)
    if not ok or char == '' then return end
    local next_cmd = resize_actions[char]
    if next_cmd then
      vim.cmd(next_cmd)
    else
      vim.api.nvim_feedkeys(char, 'n', false)
      return
    end
  end
end

for _, key in ipairs({ '<C-h>', '<C-j>', '<C-k>', '<C-l>' }) do
  vim.keymap.set('n', '<C-w>' .. key, function() resize_window(key) end,
    { silent = true, desc = 'Resize window (repeatable)' })
end

