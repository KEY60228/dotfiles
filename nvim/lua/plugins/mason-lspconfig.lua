vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gD", "<C-t>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")

return {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ast_grep",
        "ansiblels",
        "bashls",
        "buf_ls",
        "clangd",
        "cmake",
        "docker_compose_language_service",
        "dockerls",
        "gh_actions_ls",
        "golangci_lint_ls",
        "gopls",
        "graphql",
        "helm_ls",
        "jqls",
        "jsonls",
        "lua_ls",
        "sqls",
        "terraformls",
        "ts_ls",
        "vimls",
        "yamlls",
      },
    })
  end
}

