return -- Lazy
{
  "crnvl96/lazydocker.nvim",
  -- event = "VeryLazy",
  keys = {
    {
      mode = "n",
      "<Leader>ld",
      "<cmd>LazyDocker<CR>",
      desc = "Toggle LazyDocker",
    },
  },
  opts = {
    popup_window = {
      enter = true,
      focusable = true,
      zindex = 40,
      position = "50%",
      relative = "win",
      size = {
        width = "90%",
        height = "90%",
      },
      buf_options = {
        modifiable = true,
        readonly = false,
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        winblend = 0,
      },
      border = {
        highlight = "FloatBorder",
        style = "rounded",
        text = {
          top = " Lazydocker ",
        },
      },
    },
  }, -- automatically calls `require("lazydocker").setup()`
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  -- vim.keymap.set("n", "<leader>k", "<cmd>LazyDocker<CR>", { desc = "Toggle LazyDocker", noremap = true, silent = true }),
}
