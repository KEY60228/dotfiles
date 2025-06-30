return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup({
      indent = {
        highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        },
      },
    })
  end
}

