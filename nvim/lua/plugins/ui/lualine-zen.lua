return {
  "hoob3rt/lualine.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  config = function()
    -- Define highlight groups for separators

    -- Setup lualine
    require("lualine").setup {

      options = {
        theme = {
          normal = {
            a = { fg = "#16161E", bg = "#C8B185" }, -- white text on red background
            b = { fg = "#C8B185", bg = "#21212C" }, -- black text on green background
            -- c = { fg = '#DCA561', bg = '#1F1F28' },  -- blue text on white background
            c = { fg = "#DCA561", bg = "#2A2A38" }, -- blue text on white background
          },
          insert = {
            a = { fg = "#1F1F29", bg = "#D16F6B" }, -- white text on blue background
            b = { fg = "#D16F6B", bg = "#21212C" }, -- black text on green background
          },
          visual = {
            a = { fg = "#1F202A", bg = "#958AAC" }, -- white text on magenta background
            b = { fg = "#958AAC", bg = "#21212C" }, -- black text on green background
          },
          replace = {
            a = { fg = "#1F1F29", bg = "#D16F6B" }, -- white text on blue background
            b = { fg = "#D16F6B", bg = "#1F1F29" }, -- white text on blue background
          },
          inactive = {
            a = { fg = "#16161E", bg = "#C8B185" }, -- white text on red background
            b = { fg = "#C8B185", bg = "#21212C" }, -- black text on green background
            -- c = { fg = '#DCA561', bg = '#1F1F28' },  -- blue text on white background
            c = { fg = "#DCA561", bg = "#2A2A38" }, -- blue text on white background
          },
        },

        -- theme = 'auto',
        -- theme = 'auto',
        -- theme = 'nord',
        -- theme = 'everforest',
        -- theme = 'seoul256',
        -- theme = 'palenight',
        -- theme = 'modus-vivendi',
        -- theme = 'base16',
        -- theme = 'jellybeans',
        -- theme = 'kanagawa_paper',

        -- horizon

        icons_enabled = true, -- component_separators = { left = '', right = '' },

        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
          "NvimTree,NeoTree",
          TelescopePrompt = "Telescope",
          dashboard = "Dashboard",
          packer = "Packer",
          fzf = "FZF",
          alpha = "Alpha",
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
            "mode",
            separator = { left = "", right = "" },
            color = { gui = "bold" },
            -- icon = { '', align = 'left' },
          },
        },
        lualine_b = {
          { "branch", separator = { left = "", right = "" } },
          { "diagnostics", separator = { left = "", right = "" }, color = { gui = "bold" } },
        },
        -- lualine_b = { { 'branch', separator = { left = '', right = '' } }, { 'diagnostics', separator = { left = '', right = '' } } },
        lualine_c = {
          {
            "grapple",
            -- separator = { left = '', right = '' },
            separator = { left = "", right = "" },
            -- icon = { '', align = 'left' },
          },
        },
        -- lualine_b = { { 'mode', icon = { '', align = 'right', color = { fg = 'green' } } } },

        lualine_x = {

          -- {
          --   require("doing.api").status,
          --   separator = { left = "", right = "" },
          -- },

          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == "" then
                return ""
              end -- not recording
              return "Macro[" .. reg .. "]"
            end,
            separator = { left = "", right = "" },
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
            "filename",
            separator = { left = "", right = "" },
            colored = true,
          },
          {
            "filetype",
            separator = { left = "", right = "" },
            icon_only = true,
            -- colored = true,
            -- icon = { align = 'right' },
          },
        },
        lualine_z = {
          {
            function()
              return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            end,
            separator = { left = "", right = "" },

            color = { gui = "bold" },
          },
        },
      },
    }
    -- vim.opt.laststatus = 3
  end,
}
