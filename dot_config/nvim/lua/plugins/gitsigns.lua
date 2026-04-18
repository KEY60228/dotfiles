return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = ' ▎' },
        change = { text = ' ▎' },
        delete = { text = '▶︎ ' },
        topdelete = { text = '▶︎ ' },
        changedelete = { text = '~' },
        untracked = { text = '▎ ' },
      },
      signs_staged_enable = false,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 100,
        ignore_whitespace = true,
      },
    })
  end,
}
