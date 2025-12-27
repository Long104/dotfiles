return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>gl",
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
