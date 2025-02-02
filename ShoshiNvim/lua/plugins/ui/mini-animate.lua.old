return {
  'echasnovski/mini.animate',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  opts = function()
    -- Local variable for mouse scroll state
    local mouse_scrolled = false
    local animate = require 'mini.animate'

    -- Set up keymaps for mouse scrolling
    for _, scroll in ipairs { 'Up', 'Down' } do
      local key = '<ScrollWheel' .. scroll .. '>'
      vim.keymap.set({ '', 'i' }, key, function()
        mouse_scrolled = true
        return key
      end, { expr = true })
    end

    -- Define the configuration
    return {
      open = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear { duration = 150, unit = 'total' },
        winconfig = function()
          return { height = 10, width = 30 }
        end,
        winblend = require('mini.animate').gen_timing.linear { duration = 150, unit = 'total' },
      },

      resize = {
        timing = animate.gen_timing.linear { duration = 50, unit = 'total' },
      },

      scroll = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear { duration = 150, unit = 'total' },
        subscroll = require('mini.animate').gen_subscroll.equal {
          predicate = function(total_scroll)
            if mouse_scrolled then
              mouse_scrolled = false
              return false
            end
            return total_scroll > 1
          end,
        },
      },
      cursor = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear { duration = 100, unit = 'total' },
        path = function()
          return { steps = 10 }
        end,
      },
      close = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear { duration = 150, unit = 'total' },
        winconfig = function()
          return { height = 100, width = 300 }
        end,
        winblend = require('mini.animate').gen_timing.linear { duration = 150, unit = 'total' },
      },
    }
  end,
}
