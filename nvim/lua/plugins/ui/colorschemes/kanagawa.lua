return {
  'rebelot/kanagawa.nvim',
  -- Default options:
  keys = {{
    "<leader>ff","<cmd>Telescope find_files<cr>"
  }},
  ft = {'NvimTree'},
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  config = function()
    require('kanagawa').setup {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      -- transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      -- dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {
            syn = {
              parameter = 'yellow',
            },
          },
          all = {

            -- ui = {
            --     bg_gutter = "none",
            -- }
          },
        },
      },
      overrides = function(colors) -- add/modify highlights
        local theme = colors.theme
        return {
          --This will make floating windows look nicer with default borders.
          NormalFloat = { bg = 'none' },
          FloatBorder = { bg = 'none' },
          FloatTitle = { bg = 'none' },
          -- { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          -- telescope
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },


          -- for cool
          --  SignColumn = { fg = 'none', bg = 'none' },
          -- -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
          -- EndOfBuffer= { fg = 'none', bg = 'none' },
          -- FoldColumn = { fg = 'none', bg = 'none' },
          -- ColorColumn = { fg = '#808080', bg = 'none' },
          -- WinSeparator =  { fg ='#2A2A38', bg = 'none' },
          -- LineNr ={ fg = '#808080', bg = 'none' },
          -- Folded ={ fg = 'none', bg = 'none' },
          -- Conceal ={ fg = 'none', bg = 'none' },
          --
          -- WinBar = { fg = '#808080', bg = 'none' },
          -- pop up
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
      theme = 'wave', -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = 'wave', -- try "dragon" !
        light = 'lotus',
      },
    }
    -- setup must be called before loading
    -- vim.cmd 'colorscheme kanagawa'
    vim.cmd 'colorscheme kanagawa-wave'
    -- vim.cmd 'colorscheme kanagawa-dragon'
    -- vim.cmd 'colorscheme kanagawa-lotus'
  end,
}

--
-- return {
--   'rebelot/kanagawa.nvim',
--
--   config = function()
--     require('kanagawa').setup {}
-- vim.cmd("colorscheme kanagawa")
--   end
--   }
