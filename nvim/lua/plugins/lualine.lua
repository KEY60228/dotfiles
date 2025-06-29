-- disable mode display
vim.api.nvim_set_option('showmode', false)

-- source from gitsigns
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("lualine").setup({
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          {
            "filename",
            path = 1,
            newfile_status = true,
            symbols = {
              modified = "",
              readonly = "[ReadOnly]",
            },
          }
        },
        lualine_c = {
          {
            "diff",
            source = diff_source,
          },
        },
        lualine_x = {
          "branch",
        },
        lualine_y = {
          "encoding",
        },
        lualine_z = {
          "lsp_status",
        },
      },
    })
  end,
}
