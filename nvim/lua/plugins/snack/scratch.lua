return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>.",
      function()
        require("snacks").scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        require("snacks").scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
  },
  opts = {
    scratch = {
      -- your scratch configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
