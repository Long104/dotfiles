vim.keymap.set('n', '<leader>md', function()
  -- Get the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local current_buffer = vim.api.nvim_get_current_buf()
  local start_row = cursor_pos[1] - 1
  local col = cursor_pos[2]
  -- Get the current line
  local line = vim.api.nvim_buf_get_lines(current_buffer, start_row, start_row + 1, false)[1]
  -- Check if the line already starts with a bullet point
  if line:match '^%s*%-' then
    -- Remove the bullet point from the start of the line
    line = line:gsub('^%s*%-', '')
    vim.api.nvim_buf_set_lines(current_buffer, start_row, start_row + 1, false, { line })
    return
  end
  -- Search for newline to the left of the cursor position
  local left_text = line:sub(1, col)
  local bullet_start = left_text:reverse():find '\n'
  if bullet_start then
    bullet_start = col - bullet_start
  end
  -- Search for newline to the right of the cursor position and in following lines
  local right_text = line:sub(col + 1)
  local bullet_end = right_text:find '\n'
  local end_row = start_row
  while not bullet_end and end_row < vim.api.nvim_buf_line_count(current_buffer) - 1 do
    end_row = end_row + 1
    local next_line = vim.api.nvim_buf_get_lines(current_buffer, end_row, end_row + 1, false)[1]
    if next_line == '' then
      break
    end
    right_text = right_text .. '\n' .. next_line
    bullet_end = right_text:find '\n'
  end
  if bullet_end then
    bullet_end = col + bullet_end
  end
  -- Extract lines
  local text_lines = vim.api.nvim_buf_get_lines(current_buffer, start_row, end_row + 1, false)
  local text = table.concat(text_lines, '\n')
  -- Add bullet point at the start of the text
  local new_text = '- ' .. text
  local new_lines = vim.split(new_text, '\n')
  -- Set new lines in buffer
  vim.api.nvim_buf_set_lines(current_buffer, start_row, end_row + 1, false, new_lines)
end, { desc = '[P]Toggle bullet point (dash)' })

-- Toggle bold text
vim.keymap.set('v', '<leader>mb', function()
  -- Get the selected text range
  local start_row, start_col = unpack(vim.fn.getpos "'<", 2, 3)
  local end_row, end_col = unpack(vim.fn.getpos "'>", 2, 3)
  -- Get the selected lines
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)
  local selected_text = table.concat(lines, '\n'):sub(start_col, #lines == 1 and end_col or -1)
  if selected_text:match '^%*%*.*%*%*$' then
    vim.notify('Text already bold', vim.log.levels.INFO)
  else
    vim.cmd 'normal 2sa*'
  end
end, { desc = '[P]BOLD current selection' })

vim.keymap.set('n', '<leader>mb', function()
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local current_buffer = vim.api.nvim_get_current_buf()
  local start_row = cursor_pos[1] - 1
  local col = cursor_pos[2]
  -- Get the current line
  local line = vim.api.nvim_buf_get_lines(current_buffer, start_row, start_row + 1, false)[1]
  -- Check if the cursor is on an asterisk
  if line:sub(col + 1, col + 1):match '%*' then
    vim.notify('Cursor is on an asterisk, run inside the bold text', vim.log.levels.WARN)
    return
  end
  -- Search for '**' to the left of the cursor position
  local left_text = line:sub(1, col)
  local bold_start = left_text:reverse():find '%*%*'
  if bold_start then
    bold_start = col - bold_start
  end
  -- Search for '**' to the right of the cursor position and in following lines
  local right_text = line:sub(col + 1)
  local bold_end = right_text:find '%*%*'
  local end_row = start_row
  while not bold_end and end_row < vim.api.nvim_buf_line_count(current_buffer) - 1 do
    end_row = end_row + 1
    local next_line = vim.api.nvim_buf_get_lines(current_buffer, end_row, end_row + 1, false)[1]
    if next_line == '' then
      break
    end
    right_text = right_text .. '\n' .. next_line
    bold_end = right_text:find '%*%*'
  end
  if bold_end then
    bold_end = col + bold_end
  end
  -- Remove '**' markers if found, otherwise bold the word
  if bold_start and bold_end then
    -- Extract lines
    local text_lines = vim.api.nvim_buf_get_lines(current_buffer, start_row, end_row + 1, false)
    local text = table.concat(text_lines, '\n')
    -- Calculate positions to correctly remove '**'
    -- vim.notify("bold_start: " .. bold_start .. ", bold_end: " .. bold_end)
    local new_text = text:sub(1, bold_start - 1) .. text:sub(bold_start + 2, bold_end - 1) .. text:sub(bold_end + 2)
    local new_lines = vim.split(new_text, '\n')
    -- Set new lines in buffer
    vim.api.nvim_buf_set_lines(current_buffer, start_row, end_row + 1, false, new_lines)
  -- vim.notify("Unbolded text", vim.log.levels.INFO)
  else
    -- Bold the word at the cursor position if no bold markers are found
    local before = line:sub(1, col)
    local after = line:sub(col + 1)
    local inside_surround = before:match '%*%*[^%*]*$' and after:match '^[^%*]*%*%*'
    if inside_surround then
      vim.cmd 'normal sd*.'
    else
      vim.cmd 'normal viw'
      vim.cmd 'normal 2sa*'
    end
    vim.notify('Bolded current word', vim.log.levels.INFO)
  end
end, { desc = '[P]BOLD toggle bold markers' })

-- link
vim.keymap.set({ 'x', 'v' }, '<leader>mll', function()
  -- Copy what's currently in my clipboard to the register "a lamw25wmal
  vim.cmd "let @a = getreg('+')"
  -- delete selected text
  vim.cmd 'normal d'
  -- Insert the following in insert mode
  vim.cmd 'startinsert'
  vim.api.nvim_put({ '[]() ' }, 'c', true, true)
  -- Move to the left, paste, and then move to the right
  vim.cmd 'normal F[pf('
  -- Copy what's on the "a register back to the clipboard
  vim.cmd "call setreg('+', @a)"
  -- Paste what's on the clipboard
  vim.cmd 'normal p'
  -- Leave me in normal mode or command mode
  vim.cmd 'stopinsert'
  -- Leave me in insert mode to start typing
  -- vim.cmd("startinsert")
end, { desc = '[P]Convert to link' })

vim.keymap.set('v', '<leader>mlt', function()
  -- Copy what's currently in my clipboard to the register "a lamw25wmal
  vim.cmd "let @a = getreg('+')"
  -- delete selected text
  vim.cmd 'normal d'
  -- Insert the following in insert mode
  vim.cmd 'startinsert'
  vim.api.nvim_put({ '[](){:target="_blank"} ' }, 'c', true, true)
  vim.cmd 'normal F[pf('
  -- Copy what's on the "a register back to the clipboard
  vim.cmd "call setreg('+', @a)"
  -- Paste what's on the clipboard
  vim.cmd 'normal p'
  -- Leave me in normal mode or command mode
  vim.cmd 'stopinsert'
  -- Leave me in insert mode to start typing
  -- vim.cmd("startinsert")
end, { desc = '[P]Convert to link (new tab)' })

vim.keymap.set('n', '<CR>', function()
  -- Get the current line number
  local line = vim.fn.line '.'
  -- Get the fold level of the current line
  local foldlevel = vim.fn.foldlevel(line)
  if foldlevel == 0 then
    vim.notify('No fold found', vim.log.levels.INFO)
  else
    vim.cmd 'normal! za'
  end
end, { desc = '[P]Toggle fold' })

vim.keymap.set('n', '<leader>td', function()
  -- Get the current line
  local current_line = vim.fn.getline '.'
  -- Get the current line number
  local line_number = vim.fn.line '.'
  if string.find(current_line, 'TODO:') then
    -- Replace the first occurrence of ":" with ";"
    local new_line = current_line:gsub('TODO:', 'TODO;')
    -- Set the modified line
    vim.fn.setline(line_number, new_line)
  elseif string.find(current_line, 'TODO;') then
    -- Replace the first occurrence of ";" with ":"
    local new_line = current_line:gsub('TODO;', 'TODO:')
    -- Set the modified line
    vim.fn.setline(line_number, new_line)
  else
    vim.cmd "echo 'todo item not detected'"
  end
end, { desc = '[P]TODO toggle item done or not' })

vim.keymap.set('n', '<leader>mt', function()
  local path = vim.fn.expand '%' -- Expands the current file name to a full path
  local bufnr = 0 -- The current buffer number, 0 references the current active buffer
  -- Save the current view
  -- If I don't do this, my folds are lost when I run this keymap
  vim.cmd 'mkview'
  -- Retrieves all lines from the current buffer
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local toc_exists = false -- Flag to check if TOC marker exists
  local frontmatter_end = 0 -- To store the end line number of frontmatter
  -- Check for frontmatter and TOC marker
  for i, line in ipairs(lines) do
    if i == 1 and line:match '^---$' then
      -- Frontmatter start detected, now find the end
      for j = i + 1, #lines do
        if lines[j]:match '^---$' then
          frontmatter_end = j -- Save the end line of the frontmatter
          break
        end
      end
    end
    -- Checks for the TOC marker
    if line:match '^%s*<!%-%-%s*toc%s*%-%->%s*$' then
      toc_exists = true -- Sets the flag if TOC marker is found
      break -- Stops the loop if TOC marker is found
    end
  end
  -- Inserts H1 heading and <!-- toc --> at the appropriate position
  if not toc_exists then
    if frontmatter_end > 0 then
      -- Insert after frontmatter
      vim.api.nvim_buf_set_lines(bufnr, frontmatter_end, frontmatter_end, false, { '', '# Contents', '<!-- toc -->' })
    else
      -- Insert at the top if no frontmatter
      vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { '# Contents', '<!-- toc -->' })
    end
  end
  -- Silently save the file, in case TOC being created for first time (yes, you need the 2 saves)
  vim.cmd 'silent write'
  -- Silently run markdown-toc to update the TOC without displaying command output
  vim.fn.system('markdown-toc -i ' .. path)
  vim.cmd 'edit!' -- Reloads the file to reflect the changes made by markdown-toc
  vim.cmd 'silent write' -- Silently save the file
  vim.notify('TOC updated and file saved', vim.log.levels.INFO)
  -- -- In case a cleanup is needed, leaving this old code here as a reference
  -- -- I used this code before I implemented the frontmatter check
  -- -- Moves the cursor to the top of the file
  -- vim.api.nvim_win_set_cursor(bufnr, { 1, 0 })
  -- -- Deletes leading blank lines from the top of the file
  -- while true do
  --   -- Retrieves the first line of the buffer
  --   local line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]
  --   -- Checks if the line is empty
  --   if line == "" then
  --     -- Deletes the line if it's empty
  --     vim.api.nvim_buf_set_lines(bufnr, 0, 1, false, {})
  --   else
  --     -- Breaks the loop if the line is not empty, indicating content or TOC marker
  --     break
  --   end
  -- end
  -- Restore the saved view (including folds)
  vim.cmd 'loadview'
end, { desc = '[P]Insert/update Markdown TOC' })

_G.saved_positions = {}

vim.keymap.set('n', '<leader>mm', function()
  -- Save the current cursor position
  _G.saved_positions['toc_return'] = vim.api.nvim_win_get_cursor(0)
  -- Perform a silent search for the <!-- toc --> marker and move the cursor two lines below it
  vim.cmd 'silent! /<!-- toc -->\\n\\n\\zs.*'
  -- Clear the search highlight without showing the "search hit BOTTOM, continuing at TOP" message
  vim.cmd 'nohlsearch'
  -- Retrieve the current cursor position (after moving to the TOC)
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local row = cursor_pos[1]
  -- local col = cursor_pos[2]
  -- Move the cursor to column 15 (starts counting at 0)
  -- I like just going down on the TOC and press gd to go to a section
  vim.api.nvim_win_set_cursor(0, { row, 14 })
end, { desc = '[P]Jump to the first line of the TOC' })

vim.keymap.set('n', '<leader>mn', function()
  local pos = _G.saved_positions['toc_return']
  if pos then
    vim.api.nvim_win_set_cursor(0, pos)
  end
end, { desc = '[P]Return to position before jumping' })

vim.keymap.set({ 'n', 'v' }, 'gk', function()
  -- `?` - Start a search backwards from the current cursor position.
  -- `^` - Match the beginning of a line.
  -- `##` - Match 2 ## symbols
  -- `\\+` - Match one or more occurrences of prev element (#)
  -- `\\s` - Match exactly one whitespace character following the hashes
  -- `.*` - Match any characters (except newline) following the space
  -- `$` - Match extends to end of line
  vim.cmd 'silent! ?^##\\+\\s.*$'
  -- Clear the search highlight
  vim.cmd 'nohlsearch'
end, { desc = '[P]Go to previous markdown header' })

vim.keymap.set({ 'n', 'v' }, 'gj', function()
  -- `/` - Start a search forwards from the current cursor position.
  -- `^` - Match the beginning of a line.
  -- `##` - Match 2 ## symbols
  -- `\\+` - Match one or more occurrences of prev element (#)
  -- `\\s` - Match exactly one whitespace character following the hashes
  -- `.*` - Match any characters (except newline) following the space
  -- `$` - Match extends to end of line
  vim.cmd 'silent! /^##\\+\\s.*$'
  -- Clear the search highlight
  vim.cmd 'nohlsearch'
end, { desc = '[P]Go to next markdown header' })

local function insert_heading_and_date(level)
  local date = os.date '%Y-%m-%d-%A'
  local heading = string.rep('#', level) .. ' ' -- Generate heading based on the level
  local dateLine = '[[' .. date .. ']]' -- Formatted date line
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0)) -- Get the current row number
  -- Insert both lines: heading and dateLine
  vim.api.nvim_buf_set_lines(0, row, row, false, { heading, dateLine })
  -- Move the cursor to the end of the heading
  vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
  -- Enter insert mode at the end of the current line
  vim.cmd 'startinsert!'
  return dateLine
  -- vim.api.nvim_win_set_cursor(0, { row, #heading })
end

-- Create or find a daily note based on a date line format and open it in Neovim
-- This is used in obsidian markdown files that have the "Link to non-existent
-- document" warning
local function create_daily_note(date_line)
  local home = os.getenv 'HOME'
  local year, month, day, weekday = date_line:match '%[%[(%d+)%-(%d+)%-(%d+)%-(%w+)%]%]'
  if not (year and month and day and weekday) then
    print 'No valid date found in the line'
    return
  end
  local month_abbr = os.date('%b', os.time { year = year, month = month, day = day })
  local note_dir = string.format('%s/github/obsidian_main/250-daily/%s/%s-%s', home, year, month, month_abbr)
  local note_name = string.format('%s-%s-%s-%s.md', year, month, day, weekday)
  local full_path = note_dir .. '/' .. note_name
  -- Check if the directory exists, if not, create it
  vim.fn.mkdir(note_dir, 'p')
  -- Check if the file exists and create it if not
  if vim.fn.filereadable(full_path) == 0 then
    local file = io.open(full_path, 'w')
    if file then
      file:write '# Contents\n\n<!-- toc -->\n\n- [Daily note](#daily-note)\n\n<!-- tocstop -->\n\n## Daily note\n'
      file:close()
      -- Open the file and then close it to refresh the buffer
      -- I do this, because otherwise the current file does not recognize that
      -- the new file was created
      vim.cmd('edit ' .. vim.fn.fnameescape(full_path))
      vim.cmd 'bd!'
      vim.api.nvim_echo({
        { 'CREATED DAILY NOTE\n', 'WarningMsg' },
        { full_path, 'WarningMsg' },
      }, false, {})
    else
      print('Failed to create file: ' .. full_path)
    end
  else
    print('Daily note already exists: ' .. full_path)
  end
end

-- These create the the markdown heading
-- H1
vim.keymap.set('n', '<leader>jj', function()
  local date_line = insert_heading_and_date(1)
  -- If you just want to add the heading, comment the line below
  create_daily_note(date_line)
end, { desc = '[P]H1 heading and date' })

vim.keymap.set('n', '<leader>kk', function()
  local date_line = insert_heading_and_date(2)
  -- If you just want to add the heading, comment the line below
  create_daily_note(date_line)
end, { desc = '[P]H2 heading and date' })

vim.keymap.set('n', '<leader>ll', function()
  local date_line = insert_heading_and_date(3)
  -- If you just want to add the heading, comment the line below
  create_daily_note(date_line)
end, { desc = '[P]H3 heading and date' })

vim.keymap.set('n', '<leader>;;', function()
  local date_line = insert_heading_and_date(4)
  -- If you just want to add the heading, comment the line below
  create_daily_note(date_line)
end, { desc = '[P]H4 heading and date' })

vim.keymap.set('n', '<leader>uu', function()
  local date_line = insert_heading_and_date(5)
  -- If you just want to add the heading, comment the line below
  create_daily_note(date_line)
end, { desc = '[P]H5 heading and date' })

vim.keymap.set('n', '<leader>fC', function()
  -- Use the current line for date extraction
  local current_line = vim.api.nvim_get_current_line()
  create_daily_note(current_line)
end, { desc = '[P]Create daily note' })

vim.keymap.set('n', 'gsu', function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- Adjust for 0-index in Lua
  -- This makes the `s` optional so it matches both http and https
  local pattern = 'https?://[^ ,;\'"<>%s)]*'
  -- Find the starting and ending positions of the URL
  local s, e = string.find(line, pattern)
  while s and e do
    if s <= col and e >= col then
      -- When the cursor is within the URL
      local url = string.sub(line, s, e)
      -- Update the line with backticks around the URL
      local new_line = string.sub(line, 1, s - 1) .. '`' .. url .. '`' .. string.sub(line, e + 1)
      vim.api.nvim_set_current_line(new_line)
      vim.cmd 'silent write'
      return
    end
    -- Find the next URL in the line
    s, e = string.find(line, pattern, e + 1)
    -- Save the file to update trouble list
  end
  print 'No URL found under cursor'
end, { desc = '[P]Add surrounding to URL' })

vim.keymap.set('n', '<leader>mhI', function()
  -- Save the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  -- I'm using [[ ]] to escape the special characters in a command
  vim.cmd [[:g/\(^$\n\s*#\+\s.*\n^$\)/ .+1 s/^#\+\s/#&/]]
  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)
  -- Clear search highlight
  vim.cmd 'nohlsearch'
end, { desc = '[P]Increase headings without confirmation' })

vim.keymap.set('n', '<leader>mhD', function()
  -- Save the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  -- I'm using [[ ]] to escape the special characters in a command
  vim.cmd [[:g/^\s*#\{2,}\s/ s/^#\(#\+\s.*\)/\1/]]
  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)
  -- Clear search highlight
  vim.cmd 'nohlsearch'
end, { desc = '[P]Decrease headings without confirmation' })

vim.keymap.set('n', '<leader>mD', function()
  -- Delete all marks in the current buffer
  vim.cmd 'delmarks!'
  print 'All marks deleted.'
end, { desc = '[P]Delete all marks' })

vim.keymap.set('n', '<leader>fO', function()
  local file_path = vim.fn.expand '%:p'
  if file_path ~= '' then
    local command = 'open -R ' .. vim.fn.shellescape(file_path)
    vim.fn.system(command)
    print('Opened file in Finder: ' .. file_path)
  else
    print 'No file is currently open'
  end
end, { desc = '[P]Open current file in Finder' })

vim.keymap.set('n', '<leader>fN', function()
  local file_path = vim.fn.expand '%:p'
  if file_path ~= '' then
    local command = 'open -a Neovide ' .. vim.fn.shellescape(file_path)
    -- -- I'm not using the --no-tabs arg, because if I do, my alternate neovim
    -- -- buffer doesn't work
    -- local command = "open -a Neovide --args --no-tabs " .. vim.fn.shellescape(file_path)
    vim.fn.system(command)
    print('Opened file in Neovide: ' .. file_path)
  else
    print 'No file is currently open'
  end
end, { desc = '[N]Open current file in Neovide' })

vim.keymap.set('n', '<leader>tl', '<cmd>TodoTelescope keywords=TODO<cr>', { desc = '[P]TODO list (Telescope)' })

vim.keymap.set('n', '<leader>ta', '<cmd>TodoTelescope keywords=PERF,HACK,TODO,NOTE,FIX<cr>', { desc = '[P]TODO list ALL (Telescope)' })

vim.keymap.set('n', '<leader>fD', function()
  local function delete_current_file()
    local current_file = vim.fn.expand '%:p'
    if current_file and current_file ~= '' then
      -- Check if trash utility is installed
      if vim.fn.executable 'trash' == 0 then
        vim.api.nvim_echo({
          { '- Trash utility not installed. Make sure to install it first\n', 'ErrorMsg' },
          { '- In macOS run `brew install trash`\n', nil },
        }, false, {})
        return
      end
      -- Prompt for confirmation before deleting the file
      vim.ui.input({
        prompt = "Type 'del' to delete the file '" .. current_file .. "': ",
      }, function(input)
        if input == 'del' then
          -- Delete the file using trash app
          local success, _ = pcall(function()
            vim.fn.system { 'trash', vim.fn.fnameescape(current_file) }
          end)
          if success then
            vim.api.nvim_echo({
              { 'File deleted from disk:\n', 'Normal' },
              { current_file, 'Normal' },
            }, false, {})
            -- Close the buffer after deleting the file
            vim.cmd 'bd!'
          else
            vim.api.nvim_echo({
              { 'Failed to delete file:\n', 'ErrorMsg' },
              { current_file, 'ErrorMsg' },
            }, false, {})
          end
        else
          vim.api.nvim_echo({
            { 'File deletion canceled.', 'Normal' },
          }, false, {})
        end
      end)
    else
      vim.api.nvim_echo({
        { 'No file to delete', 'WarningMsg' },
      }, false, {})
    end
  end

  delete_current_file()
end, { desc = '[P]Delete current file' })
