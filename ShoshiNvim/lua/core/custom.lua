vim.api.nvim_create_user_command('GitRefresh', function()
  vim.cmd 'e'
  vim.cmd 'bufdo e'
  vim.cmd 'NvimTreeRefresh'
end, {})

vim.keymap.set('i', '<C-g>', function()
  -- Insert the text in the desired format
  vim.cmd 'normal! a[](){:target="_blank"} '
  vim.cmd 'normal! F(pv2F/lyF[p'
  -- Leave me in normal mode or command mode
  vim.cmd 'stopinsert'
end, { desc = '[P]Paste Github link' })

vim.keymap.set('n', '<leader>gC', function()
  -- Check if GitHub CLI is installed
  local gh_installed = vim.fn.system 'command -v gh'
  if gh_installed == '' then
    print "GitHub CLI is not installed. Please install it using 'brew install gh'."
    return
  end
  -- Get the current working directory and extract the repository name
  local cwd = vim.fn.getcwd()
  local repo_name = vim.fn.fnamemodify(cwd, ':t')
  if repo_name == '' then
    print 'Failed to extract repository name from the current directory.'
    return
  end
  -- Display the message and ask for confirmation
  local confirmation = vim.fn.input('The name of the repo will be: "' .. repo_name .. '"\nType "yes" to continue: ')
  if confirmation:lower() ~= 'yes' then
    print 'Operation canceled.'
    return
  end
  -- Check if the repository already exists on GitHub
  local check_repo_command = string.format('gh repo view %s/%s', vim.fn.system("gh api user --jq '.login'"):gsub('%s+', ''), repo_name)
  local check_repo_result = vim.fn.systemlist(check_repo_command)
  if not string.find(table.concat(check_repo_result), 'Could not resolve to a Repository') then
    print("Repository '" .. repo_name .. "' already exists on GitHub.")
    return
  end
  -- Prompt for repository type
  local repo_type = vim.fn.input('Enter the repository type (private/public): '):lower()
  if repo_type ~= 'private' and repo_type ~= 'public' then
    print "Invalid repository type. Please enter 'private' or 'public'."
    return
  end
  -- Set the repository type flag
  local repo_type_flag = repo_type == 'private' and '--private' or '--public'
  -- Initialize the git repository and create the GitHub repository
  local init_command = string.format('cd %s && git init', vim.fn.shellescape(cwd))
  vim.fn.system(init_command)
  local create_command = string.format('cd %s && gh repo create %s %s --source=.', vim.fn.shellescape(cwd), repo_name, repo_type_flag)
  local create_result = vim.fn.system(create_command)
  -- Print the result of the repository creation command
  if string.find(create_result, 'https://github.com') then
    print("Repository '" .. repo_name .. "' created successfully.")
  else
    print('Failed to create the repository: ' .. create_result)
  end
end, { desc = '[P]Create GitHub repository' })

vim.keymap.set('n', 'ms', function()
  -- Simulate pressing "z=" with "m" option using feedkeys
  -- vim.api.nvim_replace_termcodes ensures "z=" is correctly interpreted
  -- 'M' is the {mode}, which in this case is 'Remap keys'. This is default.
  -- If {mode} is absent, keys are remapped.
  --
  -- I tried this keymap as usually with
  vim.cmd 'normal! 1z='
  -- But didn't work, only with nvim_feedkeys
  -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("z=", true, false, true), "m", true)
end, { desc = '[P]Spelling suggestions' })

vim.keymap.set('n', 'mss', function()
  -- Simulate pressing "z=1<CR>" to automatically pick the first suggestion
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('z=', true, false, true), 'n', false)
end, { desc = '[P]Spelling suggestions', silent = true, noremap = true })
-- vim.keymap.set('n', 'mss', function()
--   -- Simulate pressing "z=" with "m" option using feedkeys
--   -- vim.api.nvim_replace_termcodes ensures "z=" is correctly interpreted
--   -- 'M' is the {mode}, which in this case is 'Remap keys'. This is default.
--   -- If {mode} is absent, keys are remapped.
--   --
--   -- I tried this keymap as usually with
--   vim.cmd 'normal! z='
--   -- But didn't work, only with nvim_feedkeys
--   -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("z=", true, false, true), "m", true)
-- end, { desc = '[P]Spelling suggestions', silent = true, noremap = true })

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

-- spell language settings
vim.keymap.set('n', '<leader>msle', function()
  vim.opt.spelllang = 'en'
  vim.cmd "echo 'Spell language set to English'"
end, { desc = '[P]Spelling language English' })

vim.keymap.set('n', '<leader>mslb', function()
  vim.opt.spelllang = 'en,es'
  vim.cmd "echo 'Spell language set to Spanish and English'"
end, { desc = '[P]Spelling language Spanish and English' })

vim.keymap.set('n', '<leader>msg', function()
  vim.cmd 'normal! zg'
end, { desc = '[P]Spelling add word to spellfile' })

vim.keymap.set('n', '<leader>msu', function()
  vim.cmd 'normal! zug'
end, { desc = '[P]Spelling undo, remove word from list' })

vim.keymap.set('n', '<leader>msr', function()
  -- vim.cmd(":spellr")
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(':spellr\n', true, false, true), 'm', true)
end, { desc = '[P]Spelling repeat' })

vim.keymap.set('n', '<leader>fcp', function()
  local filePath = vim.fn.expand '%:~' -- Gets the file path relative to the home directory
  vim.fn.setreg('+', filePath) -- Copy the file path to the clipboard register
  print('File path copied to clipboard: ' .. filePath) -- Optional: print message to confirm
end, { desc = '[P]Copy file path to clipboard' })

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


