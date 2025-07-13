-- move buffer
vim.keymap.set({ "n", "i" }, "<C-Tab>", "<cmd>bnext<CR>")
vim.keymap.set({ "n", "i" }, "<C-S-Tab>", "<cmd>bprev<CR>")

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

