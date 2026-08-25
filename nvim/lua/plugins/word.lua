return {
  "Praczet/words-the-def.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "VeryLazy" },
  cmd = { "WordThesaurus", "WordDefinition", "WordDict" },
  keys = {
    {
      "<leader>wt",
      function()
        vim.cmd("WordThesaurus " .. vim.fn.expand("<cword>"))
      end,
      mode = { "n" },
      desc = "Synonyms for word under cursor",
    },
    {
      "<leader>wd",
      function()
        vim.cmd("WordDefinition " .. vim.fn.expand("<cword>"))
      end,
      mode = { "n" },
      desc = "Definition of word under cursor",
    },
    {
      "<leader>wl",
      function()
        vim.cmd("WordDict " .. vim.fn.expand("<cword>"))
      end,
      mode = { "n" },
      desc = "Dictionary definition for word under cursor",
    },
  },
  config = function()
    require("words-the-def").setup({})
  end,
}

