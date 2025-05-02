return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      mode = "n",
      "<leader>gf",
      function()
        require("grug-far").open { prefills = { paths = vim.fn.expand "%" } }
      end,
      desc = "replace word",
    },
  },
  cmd = "GrugFar",
  config = function()
    require("grug-far").setup {
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
    }
  end,
}
