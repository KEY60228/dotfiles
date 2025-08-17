return {
  "KEY60228/alt-diffview.nvim",
  lazy = false,
  keys = {
    { mode = "n", "<leader>do", "<cmd>AltDiffview<CR>", desc = "Open Conflict Diff" },
    { mode = "n", "<leader>dc", "<cmd>AltDiffviewClose<CR>", desc = "Close Diff" },
    { mode = "n", "<leader>dfh", "<cmd>AltDiffviewFileHistory %<CR>", desc = "Open File History" },
    { mode = "n", "<leader>dh", "<cmd>AltDiffviewOpen HEAD^<CR>", desc = "Open Diff from previous version" },
  },
  config = function()
    require("alt-diffview").setup({
      enhanced_diff_hl = true,
      keymaps = {
        file_panel = {
          ["<cr>"] = function()
           require("alt-diffview.actions").focus_entry()
          end,
        },
      },
    })
  end
}

