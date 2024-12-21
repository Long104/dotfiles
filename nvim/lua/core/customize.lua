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

-- Call the function

-- hightlihght word under cursor
-- -- Lua version in init.lua
-- vim.cmd 'highlight MyHighlightGroup guibg=#00FFFF'
--
-- -- vim.cmd 'highlight MyHighlightGroup guibg=#2E344080 guifg=#b3b3ba'
--
-- -- Create an autocommand group
-- vim.api.nvim_create_augroup('HighlightWord', { clear = true })
--
-- -- Define the autocmd for CursorMoved event
-- vim.api.nvim_create_autocmd('CursorMoved', {
--   group = 'HighlightWord',
--   callback = function()
--     -- Clear previous highlights
--     if vim.bo.filetype == 'NvimTree' then
--       return
--     end
--     vim.cmd 'match none'
--
--     -- Get the word under cursor
--     local word = vim.fn.expand '<cword>'
--
--     -- Highlight all occurrences of the word
--     if word ~= '' then
--       local escaped_word = vim.fn.escape(word, '/\\')
--       vim.cmd('match MyHighlightGroup /\\<' .. escaped_word .. '\\>/')
--     end
--   end,
-- })
