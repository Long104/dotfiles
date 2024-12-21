vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set('n', '<leader>dm', '<cmd>delm! | delm A-Z0-9<CR>', { noremap = true })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', 'e', '<cmd>e!<cr>', { desc = 'Reload' })
vim.keymap.set('n', '<leader>gitf', '<cmd>GitRefresh<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'r', '<C-r>', { desc = 'Redo', silent = true, noremap = true })
vim.keymap.set('n', '<leader>ts', '<cmd>Telescope treesitter<CR>', { noremap = true })
vim.keymap.set('n', '<leader>dm', '<cmd>delm! | delm A-Z0-9<CR>', { noremap = true })
vim.keymap.set('n', '<C-p>', '<S-m>', { noremap = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', 'dl', '<cmd>q!<CR>', { desc = 'Close current split' }) -- close current split window
vim.keymap.set('n', '<Tab-n>', '<cmd>:bn<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<Tab-p>', '<cmd>:bp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<Tab-p>', '<cmd>:bdelete<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
-- vim.keymap.set('n', '<S-Tab>', '<cmd>:bp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<S-l>', '<cmd>e #<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<A-Tab>', '<cmd>buffer#<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
-- vim.keymap.set('n', '<leader><leader>', '<cmd>e #<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<leader>bd', '<cmd>:bp|bd #<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>ba', '<cmd>:%bd|edit#|bd#<CR>', { desc = 'Close all tab only the one not' }) -- close current tab
vim.keymap.set('x', '<S-b>', '<cmd>vertical resize +6<CR>')
vim.keymap.set('x', '<S-s>', '<cmd>vertical resize -6<CR>')
vim.keymap.set('x', '<C-b>', '<cmd>res +6<cr>')
vim.keymap.set('x', '<C-s>', '<cmd>res -6<cr>')

vim.keymap.set('n', '<leader>ss', '<cmd>:set spell!<CR>', { desc = 'Toggle spell check' })
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\>C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- vim.api.nvim_set_keymap('n', '<leader>td', "<cmd>lua require('trouble.sources.telescope').open()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cp', [[<cmd>let @+ = expand("%")<CR><Left>]], { desc = 'Copy current file path to clipboard' })
vim.keymap.set('n', 'wi', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
vim.keymap.set('n', 'wu', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
vim.keymap.set('n', '<C-n>m', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
--

vim.keymap.set('n', '<leader>fx', '<cmd>!chmod +x "%"<CR>', { silent = true, desc = 'Make file executable' })
vim.keymap.set('n', '<leader>fX', '<cmd>!chmod -x "%"<CR>', { silent = true, desc = 'Remove executable flag' })

-- customize 2222222222222222222222222222222222222222222

-- Mapping to return to the previously saved cursor position

-- nvim-tree
-- vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'toggle file explorer' }) -- toggle file explorer

-- open file in preview
vim.keymap.set('n', '<leader>pr', '<cmd>!open -a \'preview\' %:p<cr>')

