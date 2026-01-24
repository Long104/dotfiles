return {
  "folke/snacks.nvim",
  keys = {
    {
      "gb",
      function()
        require("snacks").gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
  },
  opts = {
    gitbrowse = {
      -- your gitbrowse configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
