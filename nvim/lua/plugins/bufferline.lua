-- move buffer
vim.keymap.set({ "n", "i" }, "<C-Tab>", "<cmd>bnext<CR>")
vim.keymap.set({ "n", "i" }, "<C-S-Tab>", "<cmd>bprev<CR>")

-- Auto switch to next buffer when closing
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    vim.schedule(function()
      local nvim_tree = require("nvim-tree.api")
      local buffers = vim.fn.getbufinfo({ buflisted = 1 })

      -- If there are other buffers and nvim-tree is focused, switch to another buffer
      if #buffers > 0 and nvim_tree.tree.is_tree_buf() then
        vim.cmd("bnext")
      end
    end)
  end,
})

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    require("bufferline").setup({})
  end
}

