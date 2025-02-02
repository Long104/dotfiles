return {
  'sho-87/kanagawa-paper.nvim',
  keys = {{
    "<leader>ff","<cmd>Telescope find_files<cr>"
  }},
  ft = {'NvimTree'},
  priority = 1000,
  -- opts = {},
  config = function()
    -- Get the colors for the current theme
    local colors = require('kanagawa-paper.colors').setup()
    -- local palette_colors = colors.palette
    -- local theme_colors = colors.theme
    require('kanagawa-paper').setup {
      undercurl = true,
      transparent = false,
      gutter = false,
      dimInactive = false, -- disabled when transparent
      terminalColors = true,
      commentStyle = { italic = true },
      functionStyle = { italic = false },
      keywordStyle = { italic = false, bold = false },
      statementStyle = { italic = false, bold = false },
      typeStyle = { italic = false },
      colors = {
        theme = {
          -- ui = {
          --   float = {
          --     bg = colors.palette.sumiInk0,
          --   },
          -- },
        },
        palette = {
          -- change all usages of these color names
          -- sumiInk0 = "#000000",
          -- fujiWhite = "#FFFFFF",
        },
      }, -- override default palette and theme colors
      overrides = function() -- override highlight groups
        local theme = colors.theme
        return {
          -- String = { fg = colors.palette.carpYellow, italic = true },
          --           -- theme colors will update dynamically when you change theme!
          --           SomePluginHl = { fg = colors.theme.syn.type, bold = true },
          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none' },
          FloatTitle = { bg = 'none' },

          -- Save a hlgroup with dark background and dimmed foreground
          -- so that you can use it where you still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    }

    -- setup must be called before loading
    vim.cmd 'colorscheme kanagawa-paper'
  end,
}
