return {
  'Long104/hidecolumn.nvim',
  keys = {
    {
      mode = 'n',
      '<leader>hc',
      '<cmd>HideColumn<cr>',
    },
    {
      mode = 'n',
      '<leader>fm',
      '<cmd>FormatOpts<cr>',
    },
  },
  config = function()
    require('highcolumn').setup()
    -- vim.keymap.set('n', '<leader>hc', '<cmd>HideColumn<cr>')
    -- vim.keymap.set('n', '<leader>fm', '<cmd>FormatOpts<cr>')
  end,
}

-- return {
--
--   vim.api.nvim_create_user_command('FormatOpts', function()
--     vim.cmd 'normal! ggVGgq'
--   end, {}),
--   vim.api.nvim_create_user_command('HideColumn', function()
--     local current_number = vim.wo.number
--     local current_relativenumber = vim.wo.relativenumber
--     local current_signcolumn = vim.wo.signcolumn
--     -- local current_foldcolumn = vim.wo.foldcolumn
--     local current_statusline = vim.opt.statusline:get()
--     local textwidth = 35
--
--     -- Toggle the settings
--
--     vim.o.textwidth = textwidth
-- --    vim.opt.formatoptions = 'ta'
--     vim.wo.number = not current_number
--     vim.wo.relativenumber = not current_relativenumber
--     vim.wo.signcolumn = current_signcolumn == 'yes' and 'no' or 'yes' -- Toggle signcolumn
--     -- vim.wo.foldcolumn = current_foldcolumn == '1' and '0' or '1' -- Toggle foldcolumn
--     -- vim.opt.fillchars = { diff = '╱', eob = ' ' }
--     vim.wo.fillchars = 'eob: '
--     -- vim.wo.fillcharsa = 'eob:/'
--
--     -- Toggle the statusline
--     if current_statusline == '2' then
--       vim.opt.statusline = '' -- Set to empty statusline
--     else
--       vim.opt.statusline = '2' -- Set to '2'
--     end
--
--     -- Disable LSP diagnostics
--     vim.diagnostic.disable(0)
--
--     -- Clear all signs from the sign column
--     -- vim.fn.sign_unplace('*', { buffer = 0 })
--
--     -- If render-markdown plugin is loaded, disable its `sign` feature dynamically
--     if pcall(require, 'render-markdown') then
--       local render_markdown = require 'render-markdown'
--       local color1_bg = '#c76b98'
--       local color2_bg = '#8feadd'
--       local color3_bg = '#6798b0'
--       local color4_bg = '#947394'
--       local color5_bg = '#f6e2ba'
--       local color6_bg = '#f7c67f'
--       local color_fg = '#323449'
--
--       -- Heading colors (when not hovered over), extends through the entire line
--       vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], color_fg, color1_bg))
--       vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], color_fg, color2_bg))
--       vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], color_fg, color3_bg))
--       vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], color_fg, color4_bg))
--       vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], color_fg, color5_bg))
--       vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], color_fg, color6_bg))
--
--       -- Highlight for the heading and sign icons (symbol on the left)
--       -- I have the sign disabled for now, so this makes no effect
--       vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], color1_bg))
--       vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], color2_bg))
--       vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], color3_bg))
--       vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], color4_bg))
--       vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], color5_bg))
--       vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], color6_bg))
--       vim.cmd(string.format([[highlight RenderMarkdownDash cterm=bold gui=bold guifg=%s]], color6_bg))
--       vim.cmd(string.format([[highlight RenderMarkdownBullet cterm=bold gui=bold guifg=%s]], color6_bg))
--       render_markdown.setup {
--         heading = {
--           sign = false,
--           backgrounds = {
--             'Headline1Bg',
--             'Headline2Bg',
--             'Headline3Bg',
--             'Headline4Bg',
--             'Headline5Bg',
--             'Headline6Bg',
--           },
--           foregrounds = {
--             'Headline1Fg',
--             'Headline2Fg',
--             'Headline3Fg',
--             'Headline4Fg',
--             'Headline5Fg',
--             'Headline6Fg',
--           },
--         }, -- Disable heading sign
--         sign = { enabled = false },
--         -- Disable sign feature
--       }
--       vim.keymap.set('n', '<leader>hc', '<cmd>hideColumn<cr>')
--     end
--   end, {}),
-- }
