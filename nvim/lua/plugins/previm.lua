return {
  "previm/previm",
  dependencies = { "tyru/open-browser.vim" },
  ft = { "markdown" },
  init = function()
    vim.g.previm_open_cmd = "open"
  end,
}
