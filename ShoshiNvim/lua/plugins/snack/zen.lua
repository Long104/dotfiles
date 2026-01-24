return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>wm",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
  },
  opts = {
    zen = {},
  },
}
