return {
  'nyoom-engineering/oxocarbon.nvim',
  config = function()
    vim.opt.background = 'dark' -- set this to dark or light
    vim.cmd 'colorscheme oxocarbon'
    -- transparent background
    -- vim.api.nvim_set_hl(0, 'Normal', { fg = 'none', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { fg = 'none', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalNC', { fg = 'none', bg = 'none' })
    -- -- Make Sign Column transparent
    -- vim.api.nvim_set_hl(0, 'SignColumn', { fg = 'none', bg = 'none' })
    -- -- Make Line Number column transparent
    -- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#808080', bg = 'none' })
    -- -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalSB', { fg = 'none', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'Terminal', { fg = 'none', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = 'none', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'FoldColumn', { fg = 'none', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'Folded', { fg = 'none', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'Conceal', { fg = 'none', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'ColorColumn', { fg = '#808080', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#808080', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'WinBar', { fg = '#808080', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#808080', bg = 'none' })

    -- vim.api.nvim_create_autocmd('BufFilePre', {
    --   callback = function()
    --     vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#808080', bg = 'none' })
    --   end,
    -- })
  end,
}
