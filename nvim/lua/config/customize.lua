vim.cmd 'autocmd BufEnter * set formatoptions-=cro'
vim.cmd 'autocmd BufEnter * setlocal formatoptions-=cro'
-- delete all session files
local session_dir = vim.fn.stdpath 'state' .. '/sessions/'

-- Function to delete all session files

vim.keymap.set('n', '<leader>ds', function()
  if vim.fn.isdirectory(session_dir) == 1 then
    for _, file in ipairs(vim.fn.readdir(session_dir)) do
      vim.fn.delete(session_dir .. file)
    end
    print 'All session files deleted.'
  else
    print 'Session directory does not exist.'
  end
end, { desc = "delete all session", noremap = true, silent = true })


-- Read doc
vim.keymap.set('n', '<leader>gx', function()
  vim.defer_fn(function()
    vim.cmd('normal K')
  end, 0)

  vim.defer_fn(function()
    vim.cmd('normal K')
  end, 100)

  vim.defer_fn(function()
    vim.cmd('normal G')
  end, 200)

  vim.defer_fn(function()
    vim.cmd('normal gx')
  end, 300)

  vim.defer_fn(function()
    vim.cmd('normal q')
  end, 400)
end)

