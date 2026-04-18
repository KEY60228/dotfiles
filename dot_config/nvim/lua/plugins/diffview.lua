return {
  "sindrets/diffview.nvim",
  lazy = false,
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true,
      keymaps = {
        file_panel = {
          ["<cr>"] = function()
           require("diffview.actions").focus_entry()
          end,
        },
      },
    })
  end
}

