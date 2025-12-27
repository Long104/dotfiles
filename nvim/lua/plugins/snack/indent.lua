return {
  "folke/snacks.nvim",
  -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  event = { "VeryLazy" },
  -- event = {"BufReadPost", "BufWritePost", "BufNewFile"},
  opts = {
    indent = {
      -- your indent configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
