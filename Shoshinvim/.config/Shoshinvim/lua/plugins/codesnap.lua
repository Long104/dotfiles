return {
  'SergioRibera/codeshot.nvim',
  -- event = 'VeryLazy',
  keys = {
    { mode = { 'x', 'n' }, '<Leader>sls', '<cmd>SSSelected<cr>' },
    { mode = { 'x', 'n' }, '<Leader>sls', '<cmd>SSFocused<cr>' },
  },
  config = function()
    require('codeshot').setup {}
    -- Take screenshot just of selected lines
    -- vim.keymap.set('v', '<Leader>sls', ':SSSelected')
    -- -- Take screenshot of file and highlight selected lines
    -- vim.keymap.set('v', '<Leader>sls', ':SSFocused')
  end,
}
