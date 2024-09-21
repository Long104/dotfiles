

return {
  'echasnovski/mini.statusline',
  opts = {
    -- No need to copy this inside `setup()`. Will be used automatically.
    -- Content of statusline as functions which return statusline string. See
    -- `:h statusline` and code of default contents (used instead of `nil`).
    content = {
      -- Content for active window
      active = nil,
      -- Content for inactive window(s)
      inactive = nil,
    },

    -- Whether to use icons by default
    use_icons = true,

    -- Whether to set Vim's settings for statusline (make it always shown)
    set_vim_settings = true,
  },

  -- config = function()
  -- local statusline = require 'mini.statusline'
  -- -- set use_icons to true if you have a Nerd Font
  -- statusline.setup { use_icons = vim.g.have_nerd_font }
  --
  -- -- You can configure sections in the statusline by overriding their
  -- -- default behavior. For example, here we set the section for
  -- -- cursor location to LINE:COLUMN
  -- ---@diagnostic disable-next-line: duplicate-set-field
  -- statusline.section_location = function()
  --   return '%2l:%-2v'
  -- end

  -- end,
}

