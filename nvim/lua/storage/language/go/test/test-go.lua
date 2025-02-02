return {
  "yanskun/gotests.nvim",
  -- keys = {{
  -- mode = "n",
  -- }},
  cmd = { "GoTests", "GoTestsAll" },
  ft = "go",
  config = function()
    require("gotests").setup()
  end,
}
