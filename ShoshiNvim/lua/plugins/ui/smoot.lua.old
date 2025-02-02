---@diagnostic disable: missing-fields
return {
  -- NOTE: SMOTH CURSOR
  {
    'gen740/SmoothCursor.nvim',

    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    config = function()
      local cursor = require 'smoothcursor'
      local autocmd = vim.api.nvim_create_autocmd

      cursor.setup {
        type = 'default', -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

        cursor = '', -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
        texthl = 'SmoothCursor', -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
        linehl = nil, -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.
        matrix = { -- Loaded when 'type' is set to "matrix"
          head = {
            -- Picks a random character from this list for the cursor text
            cursor = require 'smoothcursor.matrix_chars',
            -- Picks a random highlight from this list for the cursor text
            texthl = {
              'SmoothCursor',
            },
            linehl = nil, -- No line highlight for the head
          },
          body = {
            length = 6, -- Specifies the length of the cursor body
            -- Picks a random character from this list for the cursor body text
            cursor = require 'smoothcursor.matrix_chars',
            -- Picks a random highlight from this list for each segment of the cursor body
            texthl = {
              'SmoothCursorGreen',
            },
          },
          tail = {
            -- Picks a random character from this list for the cursor tail (if any)
            cursor = nil,
            -- Picks a random highlight from this list for the cursor tail
            texthl = {
              'SmoothCursor',
            },
          },
          unstop = false, -- Determines if the cursor should stop or not (false means it will stop)
        },
      }

      autocmd({ 'ModeChanged' }, {
        callback = function()
          local current_mode = vim.fn.mode()
          if current_mode == 'n' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#ff7a69' })
            vim.fn.sign_define('smoothcursor', { text = '' })
          elseif current_mode == 'v' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
            vim.fn.sign_define('smoothcursor', { text = '' })
          elseif current_mode == 'V' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
            vim.fn.sign_define('smoothcursor', { text = '' })
          elseif current_mode == '�' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
            vim.fn.sign_define('smoothcursor', { text = '' })
          elseif current_mode == 'i' then
            vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#668aab' })
            vim.fn.sign_define('smoothcursor', { text = '' })
          end
        end,
      })
    end,
  },
}
