return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { mode = { 'n', 'i', 'v', 'x' }, '<c-h>', '<ESC><cmd><C-U>TmuxNavigateLeft<cr>', { desc = 'tmux left', noremap = true, silent = true } },
      { mode = { 'n', 'i', 'v', 'x' }, '<c-j>', '<ESC><cmd><C-U>TmuxNavigateDown<cr>', { desc = 'tmux down', noremap = true, silent = true } },
      { mode = { 'n', 'i', 'v', 'x' }, '<c-k>', '<ESC><cmd><C-U>TmuxNavigateUp<cr>', { desc = 'tmux up', noremap = true, silent = true } },
      { mode = { 'n', 'i', 'v', 'x' }, '<c-l>', '<ESC><cmd><C-U>TmuxNavigateRight<cr>', { desc = 'tmux right', noremap = true, silent = true } },
      -- { mode = { 'n', 'i', 'v', 'x' }, '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>', { desc = 'tmux prev', noremap = true, silent = true } },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
