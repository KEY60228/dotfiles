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
  end
}

