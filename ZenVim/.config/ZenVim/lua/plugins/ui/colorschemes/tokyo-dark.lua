return {
  'tiagovla/tokyodark.nvim',
  opts = {
    transparent_background = true, -- set background to transparent
    gamma = 1, -- adjust the brightness of the theme
    -- gamma = 0.5, -- adjust the brightness of the theme
    --[[styles = {
        comments = { italic = true }, -- style for comments
        keywords = { italic = true }, -- style for keywords
        identifiers = { italic = true }, -- style for identifiers
        functions = {}, -- style for functions
        variables = {}, -- style for variables
    },]]
    custom_highlights = {} or function(highlights, palette)
      return {}
    end, -- extend highlights
    custom_palette = {} or function(palette)
      return {}
    end, -- extend palette
    terminal_colors = true, -- enable terminal colors
    -- custom options here
  },
  config = function(_, opts)
    require('tokyodark').setup(opts) -- calling setup is optional
    vim.cmd [[
    colorscheme tokyodark

  "highlight StatusLine guibg=#000000 guifg=#000000
  "highlight StatusLineNC guibg=#000000 guifg=#000000
    ]]

    --     -- Set highlight groups for statusline
    --     vim.cmd [[
    --
    --   highlight StatusLine guibg=#000000 guifg=#000000
    --   highlight StatusLineNC guibg=#000000 guifg=#000000
    -- ]]

    -- Configure statusline
    -- vim.o.statusline = '%#StatusLine# %f %m %y %r %= %p%% %l:%c '
  end,
}
