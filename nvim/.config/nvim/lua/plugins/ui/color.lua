-- return { {
--     "folke/tokyonight.nvim",
--     priority = 1000, -- make sure to load this before all the other start plugins config = function()
--       require("tokyonight").setup({
--         integrations = {
--           treesitter = true,
--         },
-- --         -- style = "day",
--         -- style = "storm", -- style = "moon",
--         -- style = "night",
--         style = "tokyonight",
--         styles = {
--         sidebars = "transparent", -- style for sidebars, see below
--           floats = "transparent",
--
--         },
--         transparent = true,
--       })
--
--       -- Set specific modifications after setting up the color scheme
--       vim.g.tokyonight_dark_float = false
--       vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
--
--       -- Apply the Tokyo Night color scheme
--       vim.cmd([[colorscheme tokyonight]])
--     end,
--   },
-- }

-- return {
--   'tiagovla/tokyodark.nvim',
--   opts = {
--     transparent_background = true, -- set background to transparent
--     gamma = 1, -- adjust the brightness of the theme
--     -- gamma = 0.5, -- adjust the brightness of the theme
--     --[[styles = {
--         comments = { italic = true }, -- style for comments
--         keywords = { italic = true }, -- style for keywords
--         identifiers = { italic = true }, -- style for identifiers
--         functions = {}, -- style for functions
--         variables = {}, -- style for variables
--     },]]
--     custom_highlights = {} or function(highlights, palette)
--       return {}
--     end, -- extend highlights
--     custom_palette = {} or function(palette)
--       return {}
--     end, -- extend palette
--     terminal_colors = true, -- enable terminal colors
--     -- custom options here
--   },
--   config = function(_, opts)
--     require('tokyodark').setup(opts) -- calling setup is optional
--     vim.cmd [[colorscheme tokyodark]]
--   end,
-- }

return {
  'rebelot/kanagawa.nvim',
  -- Default options:
  config = function()
    require('kanagawa').setup {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      -- dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {

            -- ui = {
            --     bg_gutter = "none",
            -- }
          },
        },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = 'wave', -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = 'wave', -- try "dragon" !
        light = 'lotus',
      },
    }
    -- setup must be called before loading
    vim.cmd 'colorscheme kanagawa'
    -- vim.cmd("colorscheme kanagawa-wave")
    -- vim.cmd("colorscheme kanagawa-dragon")
    -- vim.cmd("colorscheme kanagawa-lotus")
  end,

  overrides = function(colors)
    local theme = colors.theme
    return {
      --This will make floating windows look nicer with default borders.
      NormalFloat = { bg = 'none' },
      FloatBorder = { bg = 'none' },
      FloatTitle = { bg = 'none' },

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
      -- pop up
      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
      PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },
    }
  end,
}

-- return {
--   {
--     "folke/tokyonight.nvim",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       local color_dark = "#16161D"
--       local bg = "#011628"
--       local bg_dark = "#011423"
--       local bg_highlight = "#143652"
--       local bg_search = "#0A64AC"
--       local bg_visual = "#275378"
--       local fg = "#CBE0F0"
--       local fg_dark = "#B4D0E9"
--       local fg_gutter = "#627E97"
--       local border = "#547998"
--
--       require("tokyonight").setup({
--         style = "night",
--         on_colors = function(colors)
--           colors.bg = color_dark
--           colors.bg_dark = bg_dark
--           colors.bg_float = bg_dark
--           colors.bg_highlight = bg_highlight
--           colors.bg_popup = bg_dark
--           colors.bg_search = bg_search
--           colors.bg_sidebar = color_dark
--           colors.bg_statusline = bg_dark
--           colors.bg_visual = bg_visual
--           colors.border = border
--           colors.fg = fg
--           colors.fg_dark = fg_dark
--           colors.fg_float = fg
--           colors.fg_gutter = fg_gutter
--           colors.fg_sidebar = fg_dark
--         end,
--       })
--       -- load the colorscheme here
--       vim.cmd([[colorscheme tokyonight]])
--     end,
--   },
-- }

-- edrich

-- -- https://github.com/eldritch-theme/eldritch.nvim
-- --
-- -- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/colorschemes/eldritch.lua
-- -- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/colorschemes/eldritch.lua
--
-- return {
--   'eldritch-theme/eldritch.nvim',
--   lazy = true,
--   priority = 1000,
--   name = 'eldritch',
--   opts = {
--     plugins = { markdown = true },
--     -- This function is found in the documentation
--     on_highlights = function(highlights)
--       -- nvim-spectre highlight colors
--       highlights.DiffChange = { bg = '#37f499', fg = 'black' }
--       highlights.DiffDelete = { bg = '#f265b5', fg = 'black' }
--
--       -- horizontal line that goes across where cursor is
--       highlights.CursorLine = { bg = '#3f404f' }
--       -- highlights.Comment = { fg = "#a5afc2", italic = true }
--
--       -- I do the line below to change the color of bold text
--       highlights['@markup.strong'] = { fg = '#f265b5', bold = true }
--
--       -- Change the spell underline color
--       --
--       -- Every time you change an undercurl setting here, make sure to kill the tmux
--       -- session or you won't see the changes
--       --
--       -- For this to work in kitty, you need to add some configs to your
--       -- tmux.conf file, go to that file and look for "Undercurl support"
--       --
--       -- You could also set these to bold or italic if you wanted, example:
--       -- highlights.SpellBad = { sp = "#37f499", undercurl = true, bold = true, italic = true }
--       --
--       highlights.SpellBad = { sp = '#f16c75', undercurl = true, bold = true, italic = true }
--       highlights.SpellCap = { sp = '#f1fc79', undercurl = true, bold = true, italic = true }
--       highlights.SpellLocal = { sp = '#ebfafa', undercurl = true, bold = true, italic = true }
--       highlights.SpellRare = { sp = '#a48cf2', undercurl = true, bold = true, italic = true }
--
--       -- highlights.SpellBad = { sp = "#f16c75", undercurl = true }
--       -- highlights.SpellCap = { sp = "#f16c75", undercurl = true }
--       -- highlights.SpellLocal = { sp = "#f16c75", undercurl = true }
--       -- highlights.SpellRare = { sp = "#f16c75", undercurl = true }
--
--       -- My headings are this color, so this is not a good idea
--       -- highlights.SpellBad = { sp = "#f16c75", undercurl = true, fg = "#37f499" }
--       -- highlights.SpellCap = { sp = "#f16c75", undercurl = true, fg = "#37f499" }
--       -- highlights.SpellLocal = { sp = "#f16c75", undercurl = true, fg = "#37f499" }
--       -- highlights.SpellRare = { sp = "#f16c75", undercurl = true, fg = "#37f499" }
--
--       -- These colors are used by mini-files.lua to show git changes
--       highlights.MiniDiffSignAdd = { fg = '#f1fc79', bold = true }
--       highlights.MiniDiffSignChange = { fg = '#37f499', bold = true }
--
--       -- highlights.Normal = { bg = "#09090d", fg = "#ebfafa" }
--     end,
--     -- Overriding colors globally
--     -- These colors can be found in the palette.lua file
--     -- https://github.com/eldritch-theme/eldritch.nvim/blob/master/lua/eldritch/palette.lua
--     on_colors = function(colors)
--       -- This is in case you want to change the background color (where you type
--       -- text in neovim)
--       -- colors.bg = '#09090d'
--       colors.comment = '#a5afc2'
--     end,
--   },
-- }
