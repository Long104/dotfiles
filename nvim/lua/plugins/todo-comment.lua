return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- event = {"BufReadPost", "BufWritePost", "BufNewFile"},
  event = {"VeryLazy"},
  keys = {
    {
      mode = { "n" },
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous todo comment",
    },
    {
      mode = { "n" },
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next todo comment",
    },
  },
  opts = {},
}
