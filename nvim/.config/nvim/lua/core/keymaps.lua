vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>gf', '<cmd>GitRefresh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'e', '<C-r>', { desc = 'Redo' })
vim.keymap.set('n', 'qa', '<cmd>qa!<cr>', { desc = 'delete' })
vim.keymap.set('n', 'wqa', '<cmd>wqa<cr>', { desc = 'delete' })
-- vim.api.nvim_set_keymap('n', '<leader>td', "<cmd>lua require('trouble.sources.telescope').open()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ts', '<cmd>Telescope treesitter<CR>', { noremap = true })
vim.keymap.set('n', '<leader>dm', '<cmd>delm! | delm A-Z0-9<CR>', { noremap = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>sd', '<cmd>q!<CR>', { desc = 'Close current split' }) -- close current split window
vim.keymap.set('n', '<S-l>', '<cmd>:bn<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<S-h>', '<cmd>:bp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<leader>bd', '<cmd>:bp|bd #<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>ba', '<cmd>:%bd|edit#|bd#<CR>', { desc = 'Close all tab only the one not' }) -- close current tab
vim.keymap.set('n', '<S-b>', '<cmd>vertical resize +6<CR>')
vim.keymap.set('n', '<S-s>', '<cmd>vertical resize -6<CR>')
vim.keymap.set('n', '<C-b>', '<cmd>res +6<cr>')
vim.keymap.set('n', '<C-s>', '<cmd>res -6<cr>')

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.api.nvim_set_keymap('n', '<leader>td', "<cmd>lua require('trouble.sources.telescope').open()<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>cp', [[<cmd>let @+ = expand("%")<CR><Left>]], { desc = 'Copy current file path to clipboard' })
vim.keymap.set('n', '<leader>si', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
vim.keymap.set('n', '<leader>su', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Delete buffer without changing window layout' })
--

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
