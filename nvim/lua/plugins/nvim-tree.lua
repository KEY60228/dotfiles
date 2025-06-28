-- open File Tree when open
local function open_nvim_tree()
    require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { mode = "n", "<M-b>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    { mode = "n", "<M-E>", "<cmd>NvimTreeFocus<CR>", desc = "Focus NvimTree" },
  },
  config = function()
    local api = require("nvim-tree.api")

    local function my_on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      local function edit_or_open()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
          -- expand or collapse folder
          api.node.open.edit()
        else
          -- open file
          api.node.open.edit()
        end
      end

      local function close_node()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil and node.open then
          -- Close folder
          api.node.open.edit()
        else
          -- Move parent directory
          api.node.navigate.parent_close()
        end
      end

      -- デフォルトマッピング
      api.config.mappings.default_on_attach(bufnr)

      -- カスタムマッピング
      vim.keymap.set('n', 'l', edit_or_open, opts('Edit File or Open Directory'))
      vim.keymap.set('n', 'h', close_node, opts('Close Directory'))
      vim.keymap.set('n', '<M-n>', api.fs.create, opts('Create File'))
      vim.keymap.set('n', '<M-N>', api.fs.create, opts('Create Directory'))
      vim.keymap.set('n', '<CR>', api.fs.rename_node, opts('Rename File/Directory'))
      vim.keymap.set('n', '<Del>', api.fs.remove, opts('Delete File/Directory'))
      vim.keymap.set('n', 'd', '<Nop>', opts('Disable d key'))
    end

    require("nvim-tree").setup({
      on_attach = my_on_attach,
      git = { enable = true },
      view = {
        signcolumn = "no",
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = 'name',
        icons = {
          glyphs = {
            git = {
              unstaged = '!',
              renamed = '»',
              untracked = '?',
              deleted = '✘',
              staged = '✓',
              unmerged = '',
              ignored = '◌',
            },
          },
        },
      },
      actions = {
        expand_all = {
          exclude = { '.git' },
        },
      },
    })
  end,
}

