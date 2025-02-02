return {
  "razak17/tailwind-fold.nvim",
  keys = {
    {
      "<leader>tw",
      "<cmd>TailwindFoldToggle<cr>",
      desc = "Toggle Tailwind Fold",
    },
    {
      mode = { "n", "t", "i", "x" },
      "<leader>tf",
      false,
    },
  },
  opts = {
    enabled = true,
    symbol = "…", -- 󱏿
    highlight = {
      fg = "#38BDF8", -- [[ symbol color ]]
    },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  -- ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'javascriptreact', 'php', 'blade' },
}
