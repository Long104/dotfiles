
return {
  'm4xshen/autoclose.nvim',
  -- event = { 'InsertEnter', 'BufEnter', 'BufWritePost', 'InsertLeave', 'BufReadPost' },

  event = { 'InsertEnter' },
  -- require("autoclose").setup({
  --    keys = {
  --       ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
  -- [">"] = { escape = false, close = false, pair = "<>", disabled_filetypes = {} },
  --options = {
  -- disabled_filetypes = { "text", "markdown" },
  -- },
  --    },
  -- })
  config = function()
    require('autoclose').setup {
      options = {
        disabled_filetypes = { 'text' },
        -- disable_when_touch = false,
        disable_when_touch = true,
        touch_regex = '[%w(%[{]',
        pair_spaces = true,
        auto_indent = true,
        disable_command_mode = false,
      },
      keys = {
        ['('] = { escape = false, close = true, pair = '()' },
        ['['] = { escape = false, close = true, pair = '[]' },
        ['{'] = { escape = false, close = true, pair = '{}' },

        ['>'] = { escape = true, close = false, pair = '<>' },
        [')'] = { escape = true, close = false, pair = '()' },
        [']'] = { escape = true, close = false, pair = '[]' },
        ['}'] = { escape = true, close = false, pair = '{}' },

        ['"'] = { escape = true, close = true, pair = '""' },
        ["'"] = { escape = true, close = true, pair = "''" },
        ['`'] = { escape = true, close = true, pair = '``' },
      },
    }
  end,
}
