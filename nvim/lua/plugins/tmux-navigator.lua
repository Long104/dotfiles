return {
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { mode = { 'n' }, '<c-h>', '<ESC><cmd><C-U>TmuxNavigateLeft<cr>' },
      { mode = { 'n' }, '<c-j>', '<ESC><cmd><C-U>TmuxNavigateDown<cr>' },
      { mode = { 'n' }, '<c-k>', '<ESC><cmd><C-U>TmuxNavigateUp<cr>' },
      { mode = { 'n' }, '<c-l>', '<ESC><cmd><C-U>TmuxNavigateRight<cr>' },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
