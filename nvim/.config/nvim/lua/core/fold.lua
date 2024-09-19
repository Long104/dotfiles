local function set_foldmethod_expr()
  -- These are lazyvim.org defaults but setting them just in case a file
  -- doesn't have them set
  if vim.fn.has 'nvim-0.10' == 1 then
    vim.opt.foldmethod = 'expr'
    -- Replace the foldexpr and foldtext with your own implementations or defaults
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    -- vim.opt.foldtext = "getline(v:foldstart).' ... ' . getline(v:foldend)"
  else
    vim.opt.foldmethod = 'indent'
    -- vim.opt.foldtext = "getline(v:foldstart).' ... ' . getline(v:foldend)"
  end
  vim.opt.foldlevel = 99
end

local function fold_headings_of_level(level)
  -- Move to the top of the file
  vim.cmd 'normal! gg'
  -- Get the total number of lines
  local total_lines = vim.fn.line '$'
  for line = 1, total_lines do
    -- Get the content of the current line
    local line_content = vim.fn.getline(line)
    -- "^" -> Ensures the match is at the start of the line
    -- string.rep("#", level) -> Creates a string with 'level' number of "#" characters
    -- "%s" -> Matches any whitespace character after the "#" characters
    -- So this will match `## `, `### `, `#### ` for example, which are markdown headings
    if line_content:match('^' .. string.rep('#', level) .. '%s') then
      -- Move the cursor to the current line
      vim.fn.cursor(line, 1)
      -- Fold the heading if it matches the level
      if vim.fn.foldclosed(line) == -1 then
        vim.cmd 'normal! za'
      end
    end
  end
end

local function fold_markdown_headings(levels)
  set_foldmethod_expr()
  -- I save the view to know where to jump back after folding
  local saved_view = vim.fn.winsaveview()
  for _, level in ipairs(levels) do
    fold_headings_of_level(level)
  end
  vim.cmd 'nohlsearch'
  -- Restore the view to jump to where I was
  vim.fn.winrestview(saved_view)
end

-- Keymap for unfolding markdown headings of level 2 or above
-- vim.keymap.set('n', '<leader>mfu', function()
--   -- Reloads the file to reflect the changes
--   vim.cmd 'edit!'
--   vim.cmd 'normal! zR' -- Unfold all headings
-- end, { desc = '[P]Unfold all headings level 2 or above' })

vim.keymap.set('n', '<leader>mfu', function()
  vim.cmd 'edit!'
  vim.cmd 'normal! zR' -- Unfold all headings
end, { desc = '[P]Unfold all headings level 2 or above' })

-- Keymap for folding markdown headings of level 1 or above
vim.keymap.set('n', '<leader>mfj', function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd 'edit!'
  -- Unfold everything first or I had issues
  vim.cmd 'normal! zR'
  fold_markdown_headings { 6, 5, 4, 3, 2, 1 }
end, { desc = '[P]Fold all headings level 1 or above' })

-- Keymap for folding markdown headings of level 2 or above
-- I know, it reads like "madafaka" but "k" for me means "2"
vim.keymap.set('n', '<leader>mfk', function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd 'edit!'
  -- Unfold everything first or I had issues
  vim.cmd 'normal! zR'
  fold_markdown_headings { 6, 5, 4, 3, 2 }
end, { desc = '[P]Fold all headings level 2 or above' })

-- Keymap for folding markdown headings of level 3 or above
vim.keymap.set('n', '<leader>mfl', function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd 'edit!'
  -- Unfold everything first or I had issues
  vim.cmd 'normal! zR'
  fold_markdown_headings { 6, 5, 4, 3 }
end, { desc = '[P]Fold all headings level 3 or above' })

-- Keymap for folding markdown headings of level 4 or above
vim.keymap.set('n', '<leader>mf;', function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd 'edit!'
  -- Unfold everything first or I had issues
  vim.cmd 'normal! zR'
  fold_markdown_headings { 6, 5, 4 }
end, { desc = '[P]Fold all headings level 4 or above' })

-- Define a custom fold text function
local function custom_foldtext()
  -- Get the start and end lines of the fold
  local start_line = vim.v.foldstart

  -- Get the content of the start line
  local start_line_content = vim.fn.getline(start_line)

  -- Extract the heading text (assuming headings start with #)
  local function extract_heading(content)
    -- Match headings and capture the text after the # characters
    local heading = content:match '^(#+)%s*(.*)'
    return heading or content
  end

  -- Format the fold text to show only the heading
  local fold_text = extract_heading(start_line_content)

  return fold_text
end

-- Set the fold text to use the custom function
vim.opt.foldtext = custom_foldtext()
