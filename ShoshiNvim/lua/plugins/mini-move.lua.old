return {
  'echasnovski/mini.move',
  -- 'clvnkhr/macaltkey.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  keys = { { '<C-i>', false } },
  config = function()
    require('mini.move').setup {

      mappings = {

        -- left = '<A>h',
        -- right = '<A>l',
        -- down = '<A>j',
        -- up = '<A>k',
        left = 'sh',
        right = 'sl',
        down = 'sj',
        up = 'sk',

        -- Move current line in Normal mode
        line_left = 'sh',
        line_right = 'sl',
        line_down = 'sj',
        line_up = 'sk',

        -- Move current line in Normal mode
        -- line_left = '<A>h',
        -- line_right = '<A>l',
        -- line_down = '<A>j',
        -- line_up = '<A>k',
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    }
    -- require('macaltkey').setup()
    -- local move = require 'mini.move'
    -- local mak = require 'macaltkey'
    -- -- mak.keymap.set('n', '<a-j>', '<cmd>lua MiniMove.move_line(down)<cr>')
    -- vim.keymap.set('n', mak.convert '<a-k>', function()
    --   require('mini.move').mini_line 'down'
    -- end, { noremap = true, silent = true })
    -- I don't recommend it, but you can put
    -- require"macaltkey".os = "darwin" here to force conversions.
    -- require"macaltkey".dict = {...} here to use a custom dict.
  end,

  -- No need to copy this inside `setup()`. Will be used automatically.
  -- opts = {
  --   -- Module mappings. Use `''` (empty string) to disable one.
  --   mappings = {
  --     -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
  --     -- left = '<M-h>',
  --     -- right = '<M-l>',
  --     -- down = '<M-j>',
  --     -- up = '<M-k>',
  --     left = '<M-h>',
  --     right = '<M-l>',
  --     down = '<M-j>',
  --     up = '<M-k>',
  --
  --     -- Move current line in Normal mode
  --     line_left = '<M-h>',
  --     line_right = '<M-l>',
  --     line_down = '<A-j>',
  --     line_up = '<M-k>',
  --   },
  --
  --   -- Options which control moving behavior
  --   options = {
  --     -- Automatically reindent selection during linewise vertical move
  --     reindent_linewise = true,
  --   },
  -- },
}
