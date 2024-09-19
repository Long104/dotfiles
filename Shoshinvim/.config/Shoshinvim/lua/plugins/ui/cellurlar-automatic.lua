return {
  'eandrju/cellular-automaton.nvim',
  -- event = 'VeryLazy',
  keys = {
    { '<leader>fatb', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = 'make it rain' } },
    { '<leader>fatl', '<cmd>CellularAutomaton game_of_life<CR>', { desc = 'game of life' } },
  },
  -- lazy = true,
  -- config = function()
  --   require('cellular-automaton').setup {}
  -- end,
}
