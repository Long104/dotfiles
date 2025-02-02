-- options
local opts = function(desc)
  return { desc = desc, noremap = true, silent = true }
end
local keymap = vim.keymap.set

-- tabs
keymap('n', 'ta', '<cmd>tabonly<cr>', opts 'close all tab')
keymap('n', 'X', '<cmd>tabclose<cr>', opts 'tab close')
keymap('n', 't', '<cmd>tabedit<cr>', opts 'create')
keymap('n', '<S-k>', '<cmd>tabn<cr>', opts 'tabnext')
keymap('n', '<S-j>', '<cmd>tabp<cr>', opts 'tabprev')

-- buffer
keymap('n', 'bd', '<cmd>bp|bd #<CR>', opts 'Close current tab')
keymap('n', 'ba', '<cmd>%bd|e#|bd#<CR>', opts 'Close all tab only the one not')
keymap('n', '<Tab>', '<cmd>bn<CR>', opts 'Go to previous tab')
keymap('n', '<S-Tab>', '<cmd>bp<CR>', opts 'Go to previous tab')
