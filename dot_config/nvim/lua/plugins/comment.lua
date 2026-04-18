return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()

    local api = require('Comment.api')
    vim.keymap.set({ 'i', 'n' }, '<A-/>', api.toggle.linewise.current, { desc = 'Toggle comment' })
    vim.keymap.set('x', '<A-/>', 'gcgv', { remap = true, desc = 'Toggle comment' })
  end
}

