return {
  {
    "ramilito/kubectl.nvim",
    keys = {
      {
        mode = "n",
        "<leader>kb",
        '<cmd>lua require("kubectl").toggle()<cr>',
        desc = "Toggle kubectl terminal",
        { noremap = true, silent = true },
      },
    },
    config = function()
      require("kubectl").setup()
    end,
  },
}
