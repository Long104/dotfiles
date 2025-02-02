return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    "nvim-telescope/telescope.nvim",
    -- "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Leet",
  keys = {
    { mode = "n", "<leader>lr", "<cmd>Leet run<cr>", desc = "leet run" },
    { mode = "n", "<leader>ls", "<cmd>Leet submit<cr>", desc = "leet submit" },
    { mode = "n", "<leader><leader>l", "<cmd>Leet<cr>", desc = "leetcode start" },
  },

  opts = {
    -- configuration goes here
  },
}
