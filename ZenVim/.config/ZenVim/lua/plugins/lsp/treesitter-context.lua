return {
  'nvim-treesitter/nvim-treesitter-context',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  opts = { mode = 'cursor', max_lines = 3 },
  vim.keymap.set('n', 'sk', function()
    require('treesitter-context').go_to_context(vim.v.count1)
  end, { desc = 'go to the context', silent = true }),
}
