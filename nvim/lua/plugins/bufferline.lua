-- move buffer
vim.keymap.set("n", "<Leader>bnext", "<cmd>bnext<CR>")
vim.keymap.set("n", "<Leader>bprev", "<cmd>bprev<CR>")

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function ()
    require("bufferline").setup({})
  end
}

