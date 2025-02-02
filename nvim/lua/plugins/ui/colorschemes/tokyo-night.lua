return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()

      require('tokyonight').setup {

        integrations = {
          treesitter = true,
        },
        style = 'night',
        -- style = 'storm',
        -- style = 'day',
        -- style = 'moon',

        styles = {
          sidebars = 'transparent', -- style for sidebars, see below
          floats = 'transparent',
        },
        transparent = true,
vim.cmd[[colorscheme tokyonight]]
}
  end
}
