return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- size can be a number or function which is passed the current terminal
      size = 20,
      open_mapping = [[<A-j>]],
      hide_numbers = true,
      direction = 'float',
      float_opts = {
        border = 'single',
      },
    })

    -- Setup lazygit toggle with <A-l>
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "single",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<A-l>", "<cmd>close<CR>", {noremap = true, silent = true})
      end,
    })

    vim.keymap.set('n', '<A-l>', function()
      lazygit:toggle()
    end, { desc = 'Toggle LazyGit', silent = true })
  end
}

