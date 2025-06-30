return {
  "sindrets/diffview.nvim",
  lazy = false,
  keys = {
    { mode = "n", "<leader>do", "<cmd>Diffview<CR>", desc = "Open Conflict Diff" },
    { mode = "n", "<leader>dc", "<cmd>DiffviewClose<CR>", desc = "Close Diff" },
    { mode = "n", "<leader>dfh", "<cmd>DiffviewFileHistory %<CR>", desc = "Open File History" },
    { mode = "n", "<leader>dh", "<cmd>DiffviewOpen HEAD^<CR>", desc = "Open Diff from previous version" },
  },
  config = function()
    require("diffview").setup()
  end
}

