return {
  'hoob3rt/lualine.nvim',
  config = function()
    -- local kanagawa_paper = require("lualine.themes.kanagawa-paper")
    require('lualine').setup {
      options = {
        -- theme = kanagawa_paper
        -- theme = 'nightfly',
        -- theme = 'gruvbox',
        -- theme = 'horizon',
        -- theme = 'nord',
        -- theme = 'everforest',
        theme = 'seoul256',
        icons_enabled = true,
        -- component_separators = '|',
        -- section_separators = '',
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree,NeoTree' },
        always_divide_middle = false,
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          'branch',
          'diagnostics',
          {
            'buffers',
            show_filename_only = true, -- Shows shortened relative path when set to false.
            hide_filename_extension = false, -- Hide filename extension when set to true.
            show_modified_status = true, -- Shows indicator when the buffer is modified.

            mode = 0, -- 0: Shows buffer name
            -- 1: Shows buffer index
            -- 2: Shows buffer name + buffer index
            -- 3: Shows buffer number
            -- 4: Shows buffer name + buffer number

            max_length = vim.o.columns * 0.94, -- M
          },
        },

        lualine_b = {},
        lualine_c = {},
        lualine_x = {
          -- 'filename',
          -- 'filetype',
        },
        lualine_y = {
          {
            -- 'diagnostics',
          },
        },
        lualine_z = {
          {
            -- 'branch',
          },
        },
      },
    }
  end,
}
