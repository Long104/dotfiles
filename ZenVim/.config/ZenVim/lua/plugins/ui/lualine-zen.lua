return {
  'hoob3rt/lualine.nvim',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  config = function()
    -- Define highlight groups for separators

    -- Setup lualine
    require('lualine').setup {

      options = {
        -- theme = 'auto',
        -- theme = 'nord',
        -- theme = 'everforest',
        -- theme = 'seoul256',
        -- theme = 'palenight',
        -- theme = 'modus-vivendi',
        theme = 'base16',
        -- theme = 'jellybeans',

        -- horizon

        icons_enabled = true, -- component_separators = { left = '', right = '' },

        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
          'NvimTree,NeoTree',
          TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
          packer = 'Packer',
          fzf = 'FZF',
          alpha = 'Alpha',
        },
        always_divide_middle = true,
        globalstatus = true,
      },
      -- padding = 1,
      -- draw_empty = true
      -- component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
      -- component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
      sections = {
        lualine_a = {
          {
            'mode',
            separator = { left = '', right = '' },
            color = { gui = 'bold' },
            -- icon = { '', align = 'left' },
          },
        },
        lualine_b = {
          { 'branch', separator = { left = '', right = '' } },
          { 'diagnostics', separator = { left = '', right = '' }, color = { gui = 'bold' } },
        },
        -- lualine_b = { { 'branch', separator = { left = '', right = '' } }, { 'diagnostics', separator = { left = '', right = '' } } },
        lualine_c = {
          {
            'grapple',
            -- separator = { left = '', right = '' },
            separator = { left = '', right = '' },
            -- icon = { '', align = 'left' },
          },
        },
        -- lualine_b = { { 'mode', icon = { '', align = 'right', color = { fg = 'green' } } } },

        lualine_x = {

          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == '' then
                return ''
              end -- not recording
              return 'Macro[' .. reg .. ']'
            end,
            separator = { left = '', right = '' },
          },
        },

        lualine_y = {

          -- {
          --   function()
          --     local reg = vim.fn.reg_recording()
          --     if reg == '' then
          --       return ''
          --     end -- not recording
          --     return 'Macro[' .. reg .. ']'
          --   end,
          --   separator = { left = '', right = '' },
          -- },
          {
            'filename',
            separator = { left = '', right = '' },
            colored = true,
          },
          {
            'filetype',
            separator = { left = '', right = '' },
            icon_only = true,
            -- colored = true,
            -- icon = { align = 'right' },
          },
        },
        lualine_z = {
          {
            function()
              return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
            end,
            separator = { left = '', right = '' },

            color = { gui = 'bold' },
          },
        },
      },
    }
  end,
}
