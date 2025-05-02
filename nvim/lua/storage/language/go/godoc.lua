return {
  "fredrikaverpil/godoc.nvim",
  version = "*",
  dependencies = {
    { "nvim-telescope/telescope.nvim" }, -- optional
    -- { "folke/snacks.nvim" }, -- optional
    -- { "echasnovski/mini.pick" }, -- optional
  },
  build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
  cmd = { "GoDoc" }, -- optional
  opts = {
    adapter = {
      {
        name = "go",
        opts = {
          command = "GoDoc",
        },
      },
    },
    picker = {
      type = "telescope",
    },
  },
}
