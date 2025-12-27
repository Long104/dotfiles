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
      { mode = { "n", "i", "v", "x", "t" }, "<c-h>", "<ESC><ESC><cmd><C-U>TmuxNavigateLeft<cr>", { desc = "tmux left", noremap = true, silent = true } },
      { mode = { "n", "i", "v", "x", "t" }, "<c-j>", "<ESC><ESC><cmd><C-U>TmuxNavigateDown<cr>", { desc = "tmux down", noremap = true, silent = true } },
      { mode = { "n", "i", "v", "x", "t" }, "<c-k>", "<ESC><ESC><cmd><C-U>TmuxNavigateUp<cr>", { desc = "tmux up", noremap = true, silent = true } },
      { mode = { "n", "i", "v", "x", "t" }, "<c-l>", "<ESC><ESC><cmd><C-U>TmuxNavigateRight<cr>", { desc = "tmux right", noremap = true, silent = true } },
    },
  },
}
