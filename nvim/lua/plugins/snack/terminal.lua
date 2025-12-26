return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>th",
      function()
        require("snacks").terminal()
      end,
      desc = "Open terminal",
    },
  },
  opts = {
    terminal = {
      -- your terminal configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
