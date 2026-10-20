-- Helm templateのfiletype検出
vim.filetype.add({
  pattern = {
    ['.*/templates/.*%.ya?ml'] = 'helm',
    ['.*/templates/.*%.tpl'] = 'helm',
    ['.*/templates/NOTES%.txt'] = 'helm',
    ['helmfile.*%.ya?ml'] = 'helm',
  },
})
