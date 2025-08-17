return {
  "KEY60228/reviewthem.nvim",
  dependencies = {
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("reviewthem").setup({
      diff_tool = "alt-diffview",
      ui = "telescope",
    })
  end,
}

