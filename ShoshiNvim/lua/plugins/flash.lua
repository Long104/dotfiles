return {
  'folke/flash.nvim',
  -- event = 'VeryLazy',
  keys = {
    {
      mode = { 'n', 'o', 'x' },
      'sl',
      function()
        require('flash').jump()
      end,
    },
  },
  -- vscode = true,
  -- -@type Flash.Config
  opts = {},
  -- stylua: ignore
  config = function()

      vim.keymap.set({ "n", "x", "o" }, "<leader>sj", function()
      require("flash").jump()
      end, { desc = "Flash" })
      vim.keymap.set({ "n", "x", "o" }, "<leader>st", function()
      require("flash").toggle()
      end, { desc = "Flash" })

      vim.keymap.set({ "n", "x", "o" }, "<leader>sr", function()
      require("flash").treesitter()
      end, { desc = "Flash" })
      vim.keymap.set({ "n", "x", "o" }, "<leader>sf", function()
      require("flash").treesitter_search()
      end, { desc = "Flash" })
      vim.keymap.set({ "n", "x", "o" }, "<leader>sm", function()
      require("flash").remote()
      end, { desc = "Flash" })
  end
,
  -- keys = {
  --   { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  --   { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --   { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --   { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  -- },
}
