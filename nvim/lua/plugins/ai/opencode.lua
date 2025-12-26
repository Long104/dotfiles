return {
  'NickvanDyke/opencode.nvim',
  ---@type opencode.Config
  opts = {
    -- Set these according to https://models.dev/
    provider_id = "github-copilot", -- Provider to use for opencode requests
    model_id = "gpt-4.1",
  },
  -- stylua: ignore
  keys = {
    -- opencode.nvim exposes a general, flexible API — customize it to your workflow!
    -- But here are some examples to get you started :)
    { '<leader>oa', function() require('opencode').ask() end,                                                         desc = 'Ask opencode',                    mode = { 'n', 'v' }, },
    { '<leader>oA', function() require('opencode').ask('@file ') end,                                                 desc = 'Ask opencode about current file', mode = { 'n', 'v' }, },
    { '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end,                     desc = 'opencode Explain code near cursor' },
    { '<leader>or', function() require('opencode').prompt('Review @file for correctness and readability') end,        desc = 'opencode Review file', },
    { '<leader>of', function() require('opencode').prompt('Fix these @diagnostics') end,                              desc = 'opencode Fix errors', },
    { '<leader>oo', function() require('opencode').prompt('Optimize @selection for performance and readability') end, desc = 'opencode Optimize selection',              mode = 'v', },
    { '<leader>od', function() require('opencode').prompt('Add documentation comments for @selection') end,           desc = 'opencode Document selection',              mode = 'v', },
    { '<leader>ot', function() require('opencode').prompt('Add tests for @selection') end,                            desc = 'opencode Test selection',                  mode = 'v', },
  },
}
