return {
  'mistweaverco/kulala.nvim',
  keys = {{

    mode  = 'n', '<leader>kp', ":lua require('kulala').scratchpad()<CR>", { noremap = true, silent = true }
  }},
  -- opts = {},
  config = function()
    -- Setup is required, even if you don't pass any options
    require('kulala').setup {
      -- default_view = 'headers',
      default_view = 'headers_body',
 -- default_view = "body",
      split_direction = 'vertical',
      -- dev, test, prod, can be anything
      -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
      default_env = 'dev',
      -- enable/disable debug mode
      debug = false,
      inlay = {
        loading_icon = '⏳',
        done_icon = '✅ ',
      },
      lualine = {
        icon = '🐼',
      },

 additional_curl_options = {},
      scratchpad_default_contents = {
        '@MY_TOKEN_NAME=my_token_value',
        '@host="http://localhost:"',
        '',
        '# @name scratchpad',
        'POST https://httpbin.org/post HTTP/1.1',
        'accept: application/json',
        'content-type: application/json',
        '',
        '{',
        '  "foo": "bar"',
        '}',
        '###',
        '# @name scratchpad',
        'GET {{host}} HTTP/1.1',
        'accept: application/json',
        'content-type: application/json',
      },
      -- default_winbar_panes = { "body", "headers", "headers_body" },
      -- vscode_rest_client_environmentvars = false
    }
    vim.filetype.add {
      extension = {
        ['http'] = 'http',
      },
    }

    vim.api.nvim_set_keymap('n', '<leader>kf', ":lua require('kulala').search()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ks', ":lua require('kulala').show_stats()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '[k', ":lua require('kulala').jump_prev()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', ']k', ":lua require('kulala').jump_next()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>kr', ":lua require('kulala').run()<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(
      0,
      'n',
      '<leader>ki',
      "<cmd>lua require('kulala').inspect()<cr>",
      { noremap = true, silent = true, desc = 'Inspect the current request' }
    )
    vim.api.nvim_buf_set_keymap(
      0,
      'n',
      '<leader>kt',
      "<cmd>lua require('kulala').toggle_view()<cr>",
      { noremap = true, silent = true, desc = 'Toggle between body and headers' }
    )
    vim.opt.splitright = true
  end,
}
--
-- return{
--   "mistweaverco/kulala.nvim",
--   ft = "http",
--   keys = {
--     { "<leader>R", "", desc = "+Rest" },
--     { "<leader>Rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
--     { "<leader>Rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
--     { "<leader>Rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Jump to previous request" },
--     { "<leader>Rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Jump to next request" },
--   },
--   opts = {},
-- }
