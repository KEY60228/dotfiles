-- gofmtはタブでインデントするため、runtimeのftplugin/go.vimが
-- noexpandtab/shiftwidth=0を設定している。ここでは表示幅だけ4にする
vim.opt_local.tabstop = 4

-- 保存時にgoimports相当（importの整理）→ gofmt相当（整形）の順で実行する。
-- after/ftpluginはFileTypeのたびに読み込まれるので、
-- 重複登録しないようバッファ単位で張り直す
local group = vim.api.nvim_create_augroup('GoFormatOnSave', { clear = false })
vim.api.nvim_clear_autocmds({ group = group, buffer = 0 })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = group,
  buffer = 0,
  desc = 'goplsでimport整理とgofmtを実行',
  callback = function(args)
    local bufnr = args.buf

    for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr, name = 'gopls' })) do
      local params = {
        textDocument = vim.lsp.util.make_text_document_params(bufnr),
        range = {
          start = { line = 0, character = 0 },
          ['end'] = { line = 0, character = 0 },
        },
        context = { only = { 'source.organizeImports' }, diagnostics = {} },
      }

      local res = client:request_sync('textDocument/codeAction', params, 3000, bufnr)
      for _, action in ipairs(res and res.result or {}) do
        if action.edit then
          vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
        elseif action.command then
          client:exec_cmd(action.command, { bufnr = bufnr })
        end
      end
    end

    -- golangci_lint_lsも同じバッファに付くのでgoplsに限定する
    vim.lsp.buf.format({ bufnr = bufnr, name = 'gopls', async = false })
  end,
})
