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

-- create cmd to run the file java
vim.cmd [[let @h=":w\<CR>:sp | terminal java -cp %:p:h/class % \<CR>i"]]
vim.cmd [[let @v=":w\<CR>:vsp | terminal java -cp %:p:h class %\<CR>i"]]
vim.cmd [[
  " autocmd FileType java setlocal makeprg=javac\ -d\ class\ %
  " autocmd FileType java setlocal makeprg=javac\ -d\ %:p:h/class\ %
  autocmd FileType java setlocal makeprg=javac\ -d\ %:p:h/class\ % 
  autocmd FileType java setlocal errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
]]
-- Create a key mapping for F9 to compile Java files
-- for compile java
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function()
    vim.keymap.set('n', '<leader>jc', '<cmd>:make<CR>', { noremap = true, buffer = true, silent = true })
  end,
})
-- for run in terminal
vim.cmd [[let @r=":w\<CR>:sp | terminal ./javarun \<CR>i"]]
vim.keymap.set('n', '<leader>je', '<cmd>:! java %:p<CR>', { desc = '' })

-- for run java

--this will create public class
-- vim.cmd [[
  -- augroup ft_insert
    -- " autocmd!
    -- autocmd BufNewFile *.java exe "normal opublic class " . expand('%:t:r') . "\n{\n}\<Esc>1Go\<CR>\<CR>\<Esc>1G"
  -- augroup end
-- ]]

--[[when create file it will create package and comment]]
vim.cmd [[
  augroup ft_insert
    " autocmd!
    autocmd BufNewFile *.java call InsertJavaPackage()
  augroup end
  function! InsertJavaPackage()
  let filename = expand("%")
  let filename = substitute(filename, "\.java$", "", "")
  let dir = getcwd() . "/" . filename
  " let dir = substitute(dir, "^.*\/src\/", "", "")
let dir = substitute(dir, "^.*\/src\/.\\{-}\/", "", "")
  let dir = substitute(dir, "\/[^\/]*$", "", "")
  let dir = substitute(dir, "\/", ".", "g")
  let filename = substitute(filename, "^.*\/", "", "")
  let dir = "package " . dir . ";"
  let result = append(0, dir)
  let result = append(1, "")
  let result = append(2, "public class " . filename . " {")
  let result = append(4, "}")
endfunction
  ]]



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

