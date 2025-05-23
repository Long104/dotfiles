return {
  'nvimdev/dashboard-nvim',
  -- event = 'VimEnter',
  config = function() -- General
    -- vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#d69cbc', bold = true })
    vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#708e9c', bold = true })
    -- vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#FFFFFF', bg = '#000000', italic = true })
    --
    -- -- Hyper theme
    -- vim.api.nvim_set_hl(0, 'DashboardProjectTitle', { fg = '#FFD700', bg = '#000000', bold = true })
    -- vim.api.nvim_set_hl(0, 'DashboardProjectTitleIcon', { fg = '#00FFFF', bg = '#000000' })
    -- vim.api.nvim_set_hl(0, 'DashboardProjectIcon', { fg = '#FF00FF', bg = '#000000' })
    -- vim.api.nvim_set_hl(0, 'DashboardMruTitle', { fg = '#ADFF2F', bg = '#000000', bold = true })
    -- vim.api.nvim_set_hl(0, 'DashboardMruIcon', { fg = '#FF4500', bg = '#000000' })
    -- vim.api.nvim_set_hl(0, 'DashboardFiles', { fg = '#1E90FF', bg = '#000000' })
    -- vim.api.nvim_set_hl(0, 'DashboardShortCutIcon', { fg = '#8A2BE2', bg = '#000000' })
    --
    -- -- Doome theme
    -- vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#FF69B4', bg = '#000000' })
    -- vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#32CD32', bg = '#000000', bold = true })
    -- vim.api.nvim_set_hl(0, 'DashboardIcon', { fg = '#DC143C', bg = '#000000' })
    -- vim.api.nvim_set_hl(0, 'DashboardShortCut', { fg = '#8B008B', bg = '#000000', italic = true })

local logo = [[
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⠻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⠛⢿⣄⣠⡿⠛⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣄⡀⢻⡟⢀⣠⣾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⠞⠛⠛⠛⠛⠋⠉⠙⠛⢦⡄⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⢀⣽⡿⠶⠶⠦⠤⡤⠴⠶⠶⢶⣟⡁⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⣴⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠰⣤⡈⠻⣦⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⢻⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠇⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⣠⡶⠛⠉⠙⠛⠲⠶⠶⠶⠤⠤⠤⠤⠶⠶⠞⠻⢦⡀⠀⠀⠀⠀
 ⠀⠀⠀⠀⣟⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⠀⠀⠀⠀
 ⠀⠀⠀⠀⠻⢦⣤⣈⣉⡛⠁⠘⠛⠀⠀⠀⠀⠀⢀⣀⣀⣤⡾⠃⠀⠀⠀⠀
 ⢸⡟⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⢻⡇
 ⠈⠉⢻⣋⣿⠋⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⣿⣙⡟⠉⠁
 ⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀
    ███╗   ██╗ ██████╗ ████████╗███████╗███████╗
    ████╗  ██║██╔═══██╗╚══██╔══╝██╔════╝██╔════╝
    ██╔██╗ ██║██║   ██║   ██║   █████╗  ███████╗
    ██║╚██╗██║██║   ██║   ██║   ██╔══╝  ╚════██║
    ██║ ╚████║╚██████╔╝   ██║   ███████╗███████║
    ╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚══════╝╚══════╝

          ]]
    -- local logo = [[
    --   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠋⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠈⠉⠉⠙⠛⠛⠻⢿⣿⡿⠟⠁⠀⣀⣴⣿⣿⣿⣿⣿⠟
    --   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⣉⣡⠀⣠⣴⣶⣶⣦⠄⣀⡀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⡿⢃⣾
    --   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⣾⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣠⣾⡟⢡⣾⣿⣿⣿⡿⢋⣴⣿⡿⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⢡⣾⣿
    --   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠃⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣼⣿⡟⣰⣿⣿⣿⣿⠏⣰⣿⣿⠟⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢚⣛⢿
    --   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠸⣿⠟⢰⣿⣿⣿⣿⠃⣾⣿⣿⠏⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣾
    --   ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠻⠻⠃⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢉⣴⣿⣿⣿⣿⡇⠘⣿⣿⠋⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿
    --   ⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣿⣿⠁⢀⣀⠀⢀⣾⣿⣿⣿⣿⣿⣿⠟⠉⠉⠉⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌
    --   ⣿⣿⣿⣿⣿⣿⡿⠁⣀⣤⡀⠀⠈⠻⢿⠀⣼⣿⣷⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
    --   ⣿⣿⣿⠟⠛⠙⠃⠀⣿⣿⣿⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠁⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿
    --   ⣿⠟⠁⢀⣴⣶⣶⣾⣿⣿⣿⣿⣶⡐⢦⣄⠀⠀⠈⠛⢿⣿⣿⣿⣿⡀⠀⠀⠀⠀⢀⣼⡿⢛⣩⣴⣶⣶⣶⣶⣶⣶⣭⣙⠻⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿
    --   ⠁⠀⣴⣿⣿⣿⣿⠿⠿⣿⣿⣿⣿⣿⣦⡙⠻⣶⣄⡀⠀⠈⠙⢿⣿⣷⣦⣤⣤⣴⣿⡏⣠⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠻⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿
    --   ⠀⢸⣿⣿⣿⠋⣠⠔⠀⠀⠻⣿⣿⣿⣿⢉⡳⢦⣉⠛⢷⣤⣀⠀⠈⠙⠿⣿⣿⣿⣿⢸⣿⡄⠻⣿⣿⠟⡈⣿⣿⣿⣿⣿⢉⣿⣧⢹⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿
    --   ⠀⢸⣿⣿⡇⠠⡇⠀⠀⠀⠀⣿⣿⣿⣿⢸⣿⣷⣤⣙⠢⢌⡛⠷⣤⣄⠀⠈⠙⠿⣿⣿⣿⣿⣷⣦⣴⣾⣿⣤⣙⣛⣛⣥⣾⣿⣿⡌⣿⣿⣿⣷⣤⣀⣀⣀⣠⣴⣿⣿⣿⣿⣿⣿⣿
    --   ⠀⢸⣿⣿⣷⡀⠡⠀⠀⠀⣰⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣦⣌⡓⠤⣙⣿⣦⡄⠀⠈⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
    --   ⠀⢸⣿⣿⣿⣿⣶⣤⣴⣾⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣷⠀⣶⡄⠀⠈⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢃⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
    --   ⠀⢸⣿⣿⣿⣿⣿⠟⠻⣿⣿⡏⣉⣭⣭⡘⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⡇⢸⡇⢠⡀⠈⠙⠋⠉⠉⠉⠉⠛⠫⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
    --   ⠀⢸⣿⣿⠛⣿⣿⣀⣀⣾⡿⢀⣿⣿⣿⢻⣷⣦⢈⡙⠻⢿⣿⣿⣿⣿⣿⣿⣿⠀⣿⡇⢸⡇⢸⣿⠀⣦⠀⠀⠶⣶⣦⣀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
    --   ⠀⢸⣿⣿⣦⣈⡛⠿⠟⣋⣤⣾⣿⣿⣿⣸⣿⣿⢸⡇⢰⡆⢈⡙⠻⢿⣿⣿⣿⠀⢿⡇⢸⡇⢸⣿⢠⣿⡇⣿⡆⢈⡙⠻⠧⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
    --   ⠀⠀⣝⠛⢿⣿⣿⣿⣿⣿⣿⠟⣁⠀⠀⢈⠛⠿⢸⣇⢸⡇⢸⡇⣶⣦⣌⡙⠻⢄⡀⠁⠘⠇⠘⣿⢸⣿⡇⣿⡇⢸⡛⠷⣦⣄⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
    --
    --   ]]



    -- [Linkarzu.com]
    logo = string.rep('\n', 3) .. logo

    require('dashboard').setup {
      -- theme = 'hyper', -- config
      theme = 'doom', -- config
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },

      config = {
        header = vim.split(logo, '\n'),
        -- stylua: ignore
        center = {
          -- test
         -- { action = 'lua require("persistence").load()',  group = 'DashboardShortCut',         desc = " Restore Session", icon = " ", key = "r" },
          -- { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          -- { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          -- { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          -- { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          -- { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',desc = " Restore Session", icon = " ", key = "r" },
          { action = 'lua require("persistence").select()',              desc = " Selects Session", icon = " ", key = "s" },
          { action = 'lua require("persistence").load({last = true})',              desc = " Lastest Session", icon = " ", key = "l" },
          -- { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          -- { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }
  end,
}

-- db.setup({
--   theme = 'hyper',
--   config = {
-- footer = {}, -- footer
--     week_header = {
--      enable = true,
--     },
--     shortcut = {
--       { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
--       {
--         icon = ' ',
--         icon_hl = '@variable',
--         desc = 'Files',
--         group = 'Label',
--         action = 'Telescope find_files',
--         key = 'f',
--       },
--       {
--         desc = ' Apps',
--         group = 'DiagnosticHint',
--         action = 'Telescope app',
--         key = 'a',
--       },
--       {
--         desc = ' dotfiles',
--         group = 'Number',
--         action = 'Telescope dotfiles',
--         key = 'd',
--       },
--     },
--   },
-- })

-- db.setup({
--   theme = 'doom',
--   config = {
--     header = {}, --your header
--     center = {
--       {
--         icon = ' ',
--         icon_hl = 'Title',
--         desc = 'Find File           ',
--         desc_hl = 'String',
--         key = 'b',
--         keymap = 'SPC f f',
--         key_hl = 'Number',
--         key_format = ' %s', -- remove default surrounding `[]`
--         action = 'lua print(2)'
--       },
--       {
--         icon = ' ',
--         desc = 'Find Dotfiles',
--         key = 'f',
--         keymap = 'SPC f d',
--         key_format = ' %s', -- remove default surrounding `[]`
--         action = 'lua print(3)'
--       },
--     },
--     footer = {}  --your footer
--   }
-- })
