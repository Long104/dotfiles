return {
  'numToStr/FTerm.nvim',
  config = function ()
    require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})
-- local fterm = require("FTerm")
--
-- local btop = fterm:new({
--     ft = 'fterm_btop',
--     cmd = "btop"
-- })
--
--  -- Use this to toggle btop in a floating terminal
-- vim.keymap.set('n', '<A-b>', function()
--     btop:toggle()
-- end)
--
-- Example keybindings
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end
}
