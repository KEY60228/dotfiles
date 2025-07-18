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
    { mode = { "n", "i" }, "<A-b>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    { mode = "n", "<A-E>", "<cmd>NvimTreeFocus<CR>", desc = "Focus NvimTree" },
  },
  config = function()
    local api = require("nvim-tree.api")

    local function my_on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
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
      vim.keymap.set('n', 'l', api.node.open.edit, opts('Edit File or Open Directory'))
      vim.keymap.set('n', 'h', close_node, opts('Close Directory'))
      vim.keymap.set('n', '<A-n>', api.fs.create, opts('Create File'))
      vim.keymap.set('n', '<A-N>', api.fs.create, opts('Create Directory'))
      vim.keymap.set('n', '<Del>', api.fs.remove, opts('Delete File/Directory'))
      vim.keymap.set('n', 'd', '<Nop>', opts('Disable d key'))
    end

    require("nvim-tree").setup({
      on_attach = my_on_attach,
      hijack_cursor = true,
      disable_netrw = true,
      view = {
        width = 40,
      },
      renderer = {
        highlight_git = 'all',
        icons = {
          git_placement = "right_align",
          glyphs = {
            git = {
              unstaged = 'M',
              untracked = 'U',
              staged = 'A',
              deleted = 'D',
              renamed = 'R',
              unmerged = 'U',
              ignored = 'I',
            },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      git = {
        enable = true,
        show_on_open_dirs = false,
      },
      filters = {
        enable = true,
        git_ignored = false,
        custom = {
          '^\\.git$',
        },
      },
      actions = {
        change_dir = {
          enable = false,
          restrict_above_cwd = true,
        },
      },
    })
  end,
}

