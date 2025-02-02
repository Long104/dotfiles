return {
  "michaelrommel/nvim-silicon",
  -- lazy = true,
  -- cmd = "Silicon",
  main = "nvim-silicon",
  opts = {
    -- Configuration here, or leave empty to use defaults
    line_offset = function(args)
      return args.line1
    end,
  },
  config = function()
    local keymap = vim.keymap.set
    keymap("v", "<leader>sc", function()
      require("nvim-silicon").clip()
    end, { desc = "Copy code screenshot to clipboard" })
    keymap("v", "<leader>sf", function()
      require("nvim-silicon").file()
    end, { desc = "Save code screenshot as file" })
    keymap("v", "<leader>ss", function()
      require("nvim-silicon").shoot()
    end, { desc = "Create code screenshot" })
  end,
}
