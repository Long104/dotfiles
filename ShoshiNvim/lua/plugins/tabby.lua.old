return {
  'nanozuki/tabby.nvim',
  -- event = 'VimEnter', -- if you want lazy load, see below
  keys = {
    {
      mode = 'n',
      'tn',
      '<cmd>tabnew<cr>',
      desc = 'tabnext',
    },
  },
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('tabby').setup {
      -- preset = 'active_wins_at_tail',
      -- preset = 'active_wins_at_end',
    }
  end,
}
