return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavor = "auto",
      transparent_background = true,
      term_colors = true,
      styles = {
        conditionals = {},
      },
      highlight_overrides = {
        all = function(colors)
          return {
            NvimTreeFolderName = {
              fg = colors.text,
            },
            NvimTreeOpenedFolderName = {
              fg = colors.text,
            },
            NvimTreeEmptyFolderName = {
              fg = colors.text,
            },
          }
        end
      },
      integrations = {
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end
}

