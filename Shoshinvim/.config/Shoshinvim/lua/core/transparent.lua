
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

-- vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1


-- transaprent background
    vim.api.nvim_set_hl(0, 'Normal', { fg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { fg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { fg = 'none', bg = 'none' })
    -- Make Sign Column transparent
    vim.api.nvim_set_hl(0, 'SignColumn', { fg = 'none', bg = 'none' })
    -- Make Line Number column transparent
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#808080', bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalSB', { fg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'Terminal', { fg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'FoldColumn', { fg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'Folded', { fg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'Conceal', { fg = 'none', bg = 'none' })
    vim.api.nvim_set_hl(0, 'ColorColumn', { fg = '#808080', bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#808080', bg = 'none' })
    vim.api.nvim_set_hl(0, 'WinBar', { fg = '#808080', bg = 'none' })
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#808080', bg = 'none' })
