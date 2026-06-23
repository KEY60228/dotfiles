return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons", -- optional
  },
  opts = {},
  config = function()
    require("render-markdown").setup({
        latex = { enabled = false },
    })
  end
}
