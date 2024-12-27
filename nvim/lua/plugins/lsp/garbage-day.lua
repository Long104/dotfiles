return {
  "zeioth/garbage-day.nvim",
  dependencies = "neovim/nvim-lspconfig",
  event = "VeryLazy",
  opts = {
    -- your options here
  },
  config = function()
    vim.keymap.set("n", "<leader>gd", "<cmd>lua require('garbage-day.utils').stop_lsp()<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>gs", "<cmd>lua require('garbage-day.utils').start_lsp()<CR>", { noremap = true, silent = true })
  end,
}
