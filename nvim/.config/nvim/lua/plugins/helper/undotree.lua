return {
  'mbbill/undotree',

  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

    vim.cmd 'let g:undotree_WindowLayout = 3'
    vim.cmd 'let g:undotree_SplitWidth = 35'
    vim.cmd 'let g:undotree_DiffpanelHeight = 15'
  end,
}
