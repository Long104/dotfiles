
return {
  'echasnovski/mini.starter',
  event = 'VimEnter',
  config = function()
    --  local logo = table.concat({
    -- ⠀'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀ ⠀⠀'
    -- ⠀'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⠻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀ ⠀⠀'
    -- ⠀'⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⠛⢿⣄⣠⡿⠛⢻⡇⠀⠀⠀⠀⠀⠀ ⠀ ⠀⠀'
    -- ⠀'⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣄⡀⢻⡟⢀⣠⣾⠁⠀⠀⠀⠀⠀⠀ ⠀ ⠀⠀'
    -- ⠀'⠀⠀⠀⠀⠀⠀⠀⣠⡴⠞⠛⠛⠛⠛⠋⠉⠙⠛⢦⡄⠀⠀⠀⠀ ⠀ ⠀⠀'
    -- ⠀'⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠀⠀⠀⠀ ⠀ ⠀⠀'
    -- ⠀'⠀⠀⠀⠀⠀⠀⢀⣽⡿⠶⠶⠦⠤⡤⠴⠶⠶⢶⣟⡁⠀⠀⠀⠀ ⠀ ⠀⠀'
    -- ⠀'⠀⠀⠀⠀⠀⣴⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠰⣤⡈⠻⣦⠀⠀⠀ ⠀ ⠀⠀'
    -- ⠀'⠀⠀⠀⠀⠀⢻⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠇⠀⠀ ⠀⠀ ⠀'
    -- ⠀'⠀⠀⠀⣠⡶⠛⠉⠙⠛⠲⠶⠶⠶⠤⠤⠤⠤⠶⠶⠞⠻⢦⡀⠀ ⠀⠀ ⠀'
    -- ⠀'⠀⠀⠀⣟⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⠀  ⠀⠀⠀'
    --  '⠀⠀⠀⠻⢦⣤⣈⣉⡛⠁⠘⠛⠀⠀⠀⠀⠀⢀⣀⣀⣤⡾⠃⠀  ⠀⠀⠀'
    --  '⢸⡟⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⢻⡇ '
    --  '⠈⠉⢻⣋⣿⠋⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⣿⣙⡟⠉⠁ '
    --  '  ⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀ '
    --  }, '\n')

    -- local logo = table.concat({
    --   '     ⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⣀⣀⡀⡀⠀⠀⠀⠀ ⠀⠀⠀⠀',
    --   ' ⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣄⠀⠀⠀⠀⠀',
    --   ' ⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀',
    --   ' ⠀⠀⢀⣶⣿⣿⣿⣿⣿⣿⠍⠉⠀⠀⠀⠀⠉⠉⠛⠿⣿⣿⣿⣿⣿⣦⡀⠀',
    --   ' ⠀⢠⣿⣿⣿⣿⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢿⣿⣿⣿⣿⠀',
    --   ' ⢀⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡀',
    --   ' ⣼⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣷',
    --   ' ⠸⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿',
    --   ' ⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿',
    --   ' ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡟',
    --   ' ⠀⠰⣦⣄⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⡿⠀',
    --   ' ⠀⠀⠙⣿⣷⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⠏⠁⠀',
    --   ' ⠀⠀⠀⠀⠙⢿⣿⣿⣶⣤⣀⡀⠀⠀⠀⣀⣠⣤⣶⣿⣿⣿⣿⡿⠃⠀⠀⠀',
    --   ' ⠀⠀⠀⠀⠀⠀⠘⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠉⠀⠀⠀⠀⠀',
    --   '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠙⠛⠋⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    -- }, '\n')

    local logo = table.concat({
      '   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠟⠛⠿⠿⢿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      '   ⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠻⣿⣿⣿⣿⣿⣿',
      '   ⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿',
      '   ⣿⣿⣿⡿⠉⠀⠀⠀⠀⠀⠀⣲⣶⣿⣿⣿⣿⣶⣶⣤⣀⠀⠀⠀⠀⠀⠙⢿⣿⣿',
      '   ⣿⣿⡟⠀⠀⠀⠀⠀⠀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⡀⠀⠀⠀⠀⣿⣿',
      '   ⣿⡿⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢿⣿',
      '   ⣿⠃⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠈⣿',
      '   ⣿⣇⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⣿',
      '   ⣿⣿⣷⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⣿',
      '   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢠⣿',
      '   ⣿⣿⣏⠙⠻⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⢀⣿⣿',
      '   ⣿⣿⣿⣦⠀⠈⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⣰⣾⣿⣿',
      '   ⣿⣿⣿⣿⣿⣦⡀⠀⠀⠉⠛⠿⢿⣿⣿⣿⠿⠟⠛⠉⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿',
      '   ⣿⣿⣿⣿⣿⣿⣿⣧⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⣿⣿⣿⣿⣿⣿',
      '   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣦⣤⣴⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
    }, '\n')

    -- vim.api.nvim_set_hl(0, 'MiniStarterCurrent', { fg = '#FFD700', bg = '#000000', bold = true }) -- Highlight the current item
    vim.api.nvim_set_hl(0, 'MiniStarterFooter', { fg = '#d69cbc', italic = true }) -- Customize the footer
    vim.api.nvim_set_hl(0, 'MiniStarterHeader', { fg = '#d69cbc', bold = true }) -- Customize the header
    vim.api.nvim_set_hl(0, 'MiniStarterInactive', { fg = '#d69cbc' }) -- Inactive item styling
    -- vim.api.nvim_set_hl(0, 'MiniStarterItem', { fg = '#d69cbc', bold = true }) -- General item name styling
    vim.api.nvim_set_hl(0, 'MiniStarterItem', { fg = '#FF9B28', bold = true }) -- General item name styling
    vim.api.nvim_set_hl(0, 'MiniStarterItemBullet', { fg = '#d69cbc' }) -- Bullet styling
    -- vim.api.nvim_set_hl(0, 'MiniStarterItemPrefix', { fg = '#FFFF00', bold = true }) -- Unique query prefix
    -- vim.api.nvim_set_hl(0, 'MiniStarterSection', { fg = '#d69cbc', bg = '#000000' }) -- Section styling
    -- vim.api.nvim_set_hl(0, 'MiniStarterQuery', { fg = '#d69cbc', underline = true }) -- Active query styling

    -- local logo = table.concat({
    --   '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀',
    -- }, '\n')

    local starter = require 'mini.starter'
    local pad = string.rep(' ', 6)
    -- local pad = string.rep(' ', 10)
    local pad_footer = string.rep(' ', 20)

    require('mini.starter').setup {

      autoopen = true,

      -- evaluate_single = false,
      evaluate_single = true,

      items = {
        -- { name = '', action = '', section = '' },
        { name = 'Session Restore  ', action = 'lua require("persistence").load()', section = '' },
        { name = 'Session Lastest  ', action = 'lua require("persistence").load({last = true})', section = '' },
        { name = 'Session Selects  ', action = 'lua require("persistence").select()', section = '' },
        -- { name = '                             Session Selects ', action = 'lua require("persistence").select()', section = '' },
        {
          name = 'Configs Neovims ',

          action = 'Telescope find_files cwd=' .. vim.fn.stdpath 'config',
          -- action = function()
          --   require('telescope').find_files { cwd = vim.fn.stdpath 'config' }
          -- end,
          section = '',
        },
      },

      header = logo,
      -- footer = pad_footer .. 'zen',
      footer = '',

      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. '░ ', false),
        starter.gen_hook.aligning('center', 'center'),
      },
      silent = false,
    }
  end,

  -- opts = {}
}
