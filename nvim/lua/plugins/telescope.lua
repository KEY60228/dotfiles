return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        cache_picker = {
          num_pickers = 10,  -- 保持するpickerの数
          ignore_empty_prompt = true,
        },
        mappings = {
          i = {
            ['<esc>'] = require('telescope.actions').close,
          },
        },
        file_ignore_patterns = {
          "%.git/",
          "node_modules/",
        },
        path_display = { "truncate" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    telescope.load_extension("live_grep_args")

    vim.keymap.set('n', '<A-p>', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<A-P>', builtin.pickers, { desc = 'Telescope pickers' })
    vim.keymap.set('n', '<A-F>', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<A-H>', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}

