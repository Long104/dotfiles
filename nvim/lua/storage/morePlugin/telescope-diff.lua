return {
  'jemag/telescope-diff.nvim',
  keys = {
    {
      mode = 'n','<leader>tdf',"<cmd>lua require('telescope').extensions.diff.diff_files { hidden = true }<cr>",desc = 'Compare 2 files',
    },
    {
      mode = 'n','<leader>tdc',"<cmd>lua require('telescope').extensions.diff.diff_current { hidden = true }<cr>",desc = 'Compare file with current',
    },
  },
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('telescope').load_extension 'diff'

    -- vim.keymap.set('n', '<leader>tdf', function()
    --   require('telescope').extensions.diff.diff_files { hidden = true }
    -- end, { desc = 'Compare 2 files' })
    -- vim.keymap.set('n', '<leader>tdc', function()
    --   require('telescope').extensions.diff.diff_current { hidden = true }
    -- end, { desc = 'Compare file with current' })
  end,
}
