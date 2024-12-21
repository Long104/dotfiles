return {
  'Wansmer/treesj',
  -- keys = { '<space>m', '<space>j', ' <space>s' },
  keys = {  { mode = "n", 'sj', "<cmd>lua require('treesj').toggle()<cr>" }, { '<space>j', false }, { '<space>s', false } },
  -- dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('treesj').setup {--[[ your config ]]
    }
    -- For default preset
    -- vim.keymap.set('n', '<leader>j', require('treesj').toggle)
    -- For extending default preset with `recursive = true`
    -- inner like all that hve like m but all
    vim.keymap.set('n', 'sJ', function()
      require('treesj').toggle { split = { recursive = true } }
    end)
  end,
}
