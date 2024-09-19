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
vim.cmd [[let @h=":w\<CR>:sp | terminal java -cp %:p:h/class % \<CR>i"]]
vim.cmd [[let @v=":w\<CR>:vsp | terminal java -cp %:p:h class %\<CR>i"]]

--this will create public class
vim.cmd [[
  augroup ft_insert
    " autocmd!
    autocmd BufNewFile *.java exe "normal opublic class " . expand('%:t:r') . "\n{\n}\<Esc>1Go\<CR>\<CR>\<Esc>1G"
  augroup end
]]

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
  let result = append(2, "class " . filename . " {")
  let result = append(4, "}")
endfunction
  ]]

-- for golang

-- " Save the current file, open a split terminal, and run 'go run main.go'
vim.cmd [[let @g=":w\<CR>:sp | terminal go run main.go\<CR>i"]]
-- " Keybinding to trigger the command (using <leader>gr)
-- delete view

-- Function to permanently delete views created by 'mkview'
function MyDeleteView()
  local path = vim.fn.fnamemodify(vim.fn.bufname '%', ':p')
  -- Vim's odd =~ escaping for /
  path = vim.fn.substitute(path, '=', '==', 'g')
  if vim.fn.empty(vim.env.HOME) == 0 then
    path = vim.fn.substitute(path, '^' .. vim.fn.escape(vim.env.HOME, '/\\'), '~', '')
  end
  path = vim.fn.substitute(path, '/', '=+', 'g') .. '='
  -- View directory
  path = vim.o.viewdir .. '/' .. path
  vim.fn.delete(path)
  print('Deleted: ' .. path)
end

-- Command Delview (and its abbreviation 'delview')
vim.api.nvim_create_user_command('Delview', MyDeleteView, {})

-- Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
vim.cmd [[cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>]]
