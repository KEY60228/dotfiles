return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<M-p>', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<M-F>', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<M-H>', builtin.help_tags, { desc = 'Telescope help tags' })

    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = require('telescope.actions').close,
          },
        },
      },
    })
  end
}

