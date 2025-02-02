return {
  "sindrets/diffview.nvim",
  cmd = "Diff",
  keys = {
    { mode = "n", "<leader>dvc", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
    { mode = "n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
    { mode = "n", "<leader>dvr", "<cmd>DiffviewRefresh<CR>", desc = "Refresh Diffview" },
    { mode = "n", "<leader>dvt", "<cmd>DiffviewToggleFiles<CR>", desc = "Toggle Files Diffview" },
    { mode = "n", "<leader>dvfh", "<cmd>DiffviewFileHistory<CR>", desc = "diffview file history" },
    { mode = "n", "<leader>dvl", "<cmd>DiffviewLog<CR>", desc = "diffview log" },
    { mode = "n", "<leader>dvff", "<cmd>DiffviewFocusFiles<CR>", desc = "diffview focus files" },
  },
  config = function()
    require("diffview").setup {}
  end,
}
