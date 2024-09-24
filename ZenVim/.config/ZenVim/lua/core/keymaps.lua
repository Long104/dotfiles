-- emoji
-- insert mode <C-S-u>

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- options
local opts = function(desc)
  return { desc = desc, noremap = true, silent = true }
end
local keymap = vim.keymap.set
-- normal
keymap('n', '<CR>', '<Esc>', opts 'exit insert mode')
keymap('i', 'jj', '<Esc>', opts 'exit insert mode')
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts 'un select the text')
keymap('n', 'wd', '<cmd>q!<CR>', opts 'Close current split')
keymap('n', 'du', '<cmd>q!<CR>', opts 'Close current split')
keymap('n', 'dl', '<cmd>q!<CR>', opts 'Close current split')
keymap('n', 'qa', '<cmd>wqa!<CR>', opts 'Close current split')
keymap('n', 'r', '<C-r>', opts 'Redo')
keymap('n', 'e', '<cmd>e!<cr>', opts 'Reload')
keymap('n', '<leader>qa', '<cmd>wqa!<cr>', opts 'close everything')
keymap('n', '<leader>dm', '<cmd>delm! | delm A-Z0-9<CR>', opts 'delete mark')
keymap('n', '<S-l>', '<cmd>e #<CR>', opts 'Go to previous tab')

vim.api.nvim_set_keymap('x', '<leader>ci', 'c/*<C-r>"*/<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ci', 'I/* <Esc>A */<Esc>', { noremap = true, silent = true })

-- diagostic
keymap('n', 'ql', vim.diagnostic.setloclist, opts 'Open diagnostic [Q]uickfix list')
keymap('n', '<leader>h', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
end, opts 'show hint')

-- git
-- keymap('n', '<leader>gitr', '<cmd>GitRefresh<CR>', opts 'git refresh')

--resize
keymap({ 'n', 'x' }, '<C-n>k', '<cmd>res +6<cr>', opts 'windown horizontally resize +')
keymap({ 'n', 'x' }, '<C-n>j', '<cmd>res -6<cr>', opts 'window horizontally resize -')
keymap({ 'n', 'x' }, '<C-n>l', '<cmd>vertical resize +6<CR>', opts 'window vertical resize +')
keymap({ 'n', 'x' }, '<C-n>h', '<cmd>vertical resize -6<CR>', opts 'window vertical resize -')
keymap({ 'n', 'x' }, '<C-n>m', '<C-w>=', opts 'Make splits equal size')

-- window
keymap('n', 'wi', '<C-w>v', opts 'Split window vertically')
keymap('n', 'wu', '<C-w>s', opts 'Split window horizontally')
keymap('n', 'wa', '<cmd>only<CR>', opts 'Close all tab only the one not')
keymap('n', 'wd', '<cmd>close<cr>', opts 'close')

-- give permission
keymap('n', '<leader>f+x', '<cmd>!chmod +x "%"<CR>', opts 'Make file executable')
keymap('n', '<leader>f-x', '<cmd>!chmod -x "%"<CR>', opts 'Remove executable flag')
keymap('n', '<leader>cp', [[<cmd>let @+ = expand("%")<CR><Left>]], opts 'Copy current file path to clipboard')

-- lsp
keymap('n', '<leader>i', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
end, opts 'show hint')
keymap('n', '[d', vim.diagnostic.goto_prev, opts 'Go to previous [D]iagnostic message')
keymap('n', ']d', vim.diagnostic.goto_next, opts 'Go to next [D]iagnostic message')
keymap('n', '<leader>d', vim.diagnostic.open_float, opts 'Show diagnostic [E]rror messages')
keymap('n', '<leader>ql', vim.diagnostic.setloclist, opts 'Open diagnostic [Q]uickfix list')

-- Delete newlines in selected text (join)
vim.keymap.set('v', '<leader>mj', function()
  -- Get the visual selection range
  local start_row = vim.fn.line 'v'
  local end_row = vim.fn.line '.'
  -- Ensure start_row is less than or equal to end_row
  if start_row > end_row then
    start_row, end_row = end_row, start_row
  end
  -- Loop through each line in the selection
  local current_row = start_row
  while current_row <= end_row do
    local line = vim.api.nvim_buf_get_lines(0, current_row - 1, current_row, false)[1]
    -- vim.notify("Checking line " .. current_row .. ": " .. (line or ""), vim.log.levels.INFO)
    -- If the line is empty, delete it and adjust end_row
    if line == '' then
      vim.cmd(current_row .. 'delete')
      end_row = end_row - 1
    else
      current_row = current_row + 1
    end
  end
end, { desc = '[P]Delete newlines in selected text (join)' })
