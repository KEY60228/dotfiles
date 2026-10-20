-- helmはruntimeにsyntaxファイルがないためtreesitterでハイライトする
-- （クエリはgotmplに依存するため、treesitterのensure_installedにgotmplが必要）
vim.treesitter.start()
