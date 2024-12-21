return {
  'shortcuts/no-neck-pain.nvim',
  keys = {
    { mode = 'n', '<leader>nnp', '<cmd>NoNeckPain<cr>', desc = 'noneckpain toggle' },
    { mode = 'n', '<leader>nnr', '<cmd>NoNeckPainResize', desc = 'noneckpain resize' },
    { mode = 'n', '<leader>nntl', '<cmd>NoNeckPainToggleLeftSide<cr>', desc = 'noneckpain toggle left' },
    { mode = 'n', '<leader>nntr', '<cmd>NoNeckPainToggleRightSide<cr>', desc = 'noneckpain toggle right' },
    { mode = 'n', '<leader>nnwu', '<cmd>NoNeckPainWidthUp<cr>', desc = 'noneckpain width up' },
    { mode = 'n', '<leader>nnwd', '<cmd>NoNeckPainWidthDown<cr>', desc = 'noneckpain width down' },
    { mode = 'n', '<leader>np', '<cmd>NoNeckPainScratchPad<cr>', desc = 'noneckpain toggle note' },
  },
  opts = {
    buffers = {
      -- backgroundColor = 'catppuccin-frappe',
      -- backgroundColor = 'zenbones',
      blend = 0.3,
      scratchPad = {
        -- set to `false` to
        -- disable auto-saving
        enabled = true,
        -- set to `nil` to default
        -- to current working directory
        -- location = '~/Documents/',
        location = './',
      },
      bo = {
        filetype = 'md',
      },
    },
    wo = {
      fillchars = 'eob: ',
    },
  },
  config = function()
    vim.opt.laststatus = 0
    vim.opt.showtabline = 0
    vim.opt.statuscolumn = ''
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
}
-- :NoNeckPain	Toggles the plugin state, between enable and disable.
-- :NoNeckPainResize INT	Updates the config width with the given INT value and resizes the no-neck-pain windows.
-- :NoNeckPainToggleLeftSide	Toggles the left side buffer (open/close).
-- :NoNeckPainToggleRightSide	Toggles the right side buffer (open/close).
-- :NoNeckPainWidthUp	Increases the config width by 5 and resizes the no-neck-pain windows.
-- :NoNeckPainWidthDown	Decreases the config width by 5 and resizes the no-neck-pain windows.
-- :NoNeckPainScratchPad
