return {
  'stevearc/dressing.nvim',
  keys = {
    {
      mode = 'i',
      '<leader>cl',
      function()
        vim.ui.input({ prompt = '😄Calculator: ' }, function(input)
          local calc = load('return ' .. (input or ''))()
          if calc then
            vim.api.nvim_feedkeys(tostring(calc), 'i', true)
          end
        end)
      end,
    },
  },
  config = function()
    require('dressing').setup()

    -- vim.keymap.set('i', '<leader>cl', function()
    --   vim.ui.input({ prompt = '😄Calculator: ' }, function(input)
    --     local calc = load('return ' .. (input or ''))()
    --     if calc then
    --       vim.api.nvim_feedkeys(tostring(calc), 'i', true)
    --     end
    --   end)
    -- end)
  end,
}
