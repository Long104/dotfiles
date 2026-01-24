return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>lg",
      function()
        require("snacks").lazygit()
      end,
      desc = "Lazygit",
    },
  },
  opts = {
    lazygit = {},
  },
}
